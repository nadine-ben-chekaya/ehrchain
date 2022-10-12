package main

import (
  "encoding/json"
	"fmt"

  "github.com/hyperledger/fabric-contract-api-go/contractapi"
)

// SmartContract provides functions for managing an Asset
   type SmartContract struct {
      contractapi.Contract
    }

// Asset describes basic details of what makes up a simple asset
type Record struct {
	Information string    `json:"information"`
	DoctorId    string    `json:"doctorId"`
}

type Patient struct {
  ID string   `json:"id"`
	FirstName string   `json:"firstName"`
	LastName  string   `json:"lastName"`
	Age       uint8    `json:"age"`
	Address   string   `json:"address"`
}

// QueryResult structure used for handling result of query
type QueryResult struct {
	Key    string `json:"Key"`
	Record *Patient
}
//require github.com/hyperledger/fabric-contract-api-go v1.0.0

// InitLedger adds a base set of assets to the ledger
func (s *SmartContract) InitLedger(ctx contractapi.TransactionContextInterface) error {
  patients := []Patient{
    {ID: "patienta", FirstName: "nadine", LastName: "msblue", Age: 23, Address: "monastir, jemmel"},
    {ID: "patientb", FirstName: "jihen", LastName: "kidar", Age: 23, Address: "gafssa, gafssa"},
    {ID: "patientc", FirstName: "nilyana", LastName: "bnc", Age: 27, Address: "monastir, jemmel"},
    {ID: "patientd", FirstName: "nayzek", LastName: "bnc", Age: 21, Address: "monastir, jemmel"},
  }

  for _, patient := range patients {
    patientJSON, err := json.Marshal(patient)
    if err != nil {
      return err
    }

    err = ctx.GetStub().PutState(patient.ID, patientJSON)
    if err != nil {
      return fmt.Errorf("failed to put to world state. %v", err)
    }
  }

  return nil
}

// AddPatient issues a new patient to the world state with given details.
func (s *SmartContract) AddPatient(ctx contractapi.TransactionContextInterface, id string, firstName string, lastName string, age uint8, address string) error {
  exists, err := s.PatientExists(ctx, id)
  if err != nil {
    return err
  }
  if exists {
    return fmt.Errorf("the asset %s already exists", id)
  }

  patient := Patient{
    ID:                 id,
    FirstName:          firstName,
    LastName:           lastName,
    Age:                age,
    Address:            address,
  }
  patientJSON, err := json.Marshal(patient)
  if err != nil {
    return err
  }

  return ctx.GetStub().PutState(id, patientJSON)
}

// ReadAsset returns the asset stored in the world state with given id.
func (s *SmartContract) ReadPatient(ctx contractapi.TransactionContextInterface, id string) (*Patient, error) {
  patientJSON, err := ctx.GetStub().GetState(id)
  if err != nil {
    return nil, fmt.Errorf("failed to read from world state: %v", err)
  }
  if patientJSON == nil {
    return nil, fmt.Errorf("the asset %s does not exist", id)
  }

  var patient Patient
  err = json.Unmarshal(patientJSON, &patient)
  if err != nil {
    return nil, err
  }

  return &patient, nil
}

// UpdatePatient updates an existing patient in the world state with provided parameters.
func (s *SmartContract) UpdatePatient(ctx contractapi.TransactionContextInterface, id string, firstName string, lastName string, age uint8, address string) error {
  exists, err := s.PatientExists(ctx, id)
  if err != nil {
    return err
  }
  if !exists {
    return fmt.Errorf("the patient %s does not exist", id)
  }

  // overwriting original asset with new asset
  patient := Patient{
    ID:                 id,
    FirstName:          firstName,
    LastName:           lastName,
    Age:                age,
    Address:            address,
  }
  patientJSON, err := json.Marshal(patient)
  if err != nil {
    return err
  }

  return ctx.GetStub().PutState(id, patientJSON)
}


// DeletePatient deletes an given patient from the world state.
func (s *SmartContract) DeletePatient(ctx contractapi.TransactionContextInterface, id string) error {
  exists, err := s.PatientExists(ctx, id)
  if err != nil {
    return err
  }
  if !exists {
    return fmt.Errorf("the patient %s does not exist", id)
  }

  return ctx.GetStub().DelState(id)
}  

// PatientExists returns true when asset with given ID exists in world state
func (s *SmartContract) PatientExists(ctx contractapi.TransactionContextInterface, id string) (bool, error) {
  patientJSON, err := ctx.GetStub().GetState(id)
  if err != nil {
    return false, fmt.Errorf("failed to read from world state: %v", err)
  }

  return patientJSON != nil, nil
}

// TransferPatient updates the address field of patient with given id in world state.
func (s *SmartContract) TransferPatient(ctx contractapi.TransactionContextInterface, id string, newAddress string) error {
  patient, err := s.ReadPatient(ctx, id)
  if err != nil {
    return err
  }

  patient.Address = newAddress
  patientJSON, err := json.Marshal(patient)
  if err != nil {
    return err
  }

  return ctx.GetStub().PutState(id, patientJSON)
}

// TransferPatient updates the address field of patient with given id in world state.
func (s *SmartContract) TransferAge(ctx contractapi.TransactionContextInterface, id string, newAge uint8) error {
  patient, err := s.ReadPatient(ctx, id)
  if err != nil {
    return err
  }

  patient.Age = newAge
  patientJSON, err := json.Marshal(patient)
  if err != nil {
    return err
  }

  return ctx.GetStub().PutState(id, patientJSON)
}

// GetAllPatients returns all patients found in world state
func (s *SmartContract) GetAllPatients(ctx contractapi.TransactionContextInterface) ([]*Patient, error) {
  // range query with empty string for startKey and endKey does an
  // open-ended query of all assets in the chaincode namespace.
      resultsIterator, err := ctx.GetStub().GetStateByRange("", "")
      if err != nil {
        return nil, err
      }
      defer resultsIterator.Close()
  
      var patients []*Patient
      for resultsIterator.HasNext() {
        queryResponse, err := resultsIterator.Next()
        if err != nil {
          return nil, err
        }
  
        var patient Patient
        err = json.Unmarshal(queryResponse.Value, &patient)
        if err != nil {
          return nil, err
        }
        patients = append(patients, &patient)
      }
  
      return patients, nil
}

func main() {
  chaincode, err := contractapi.NewChaincode(new(SmartContract))

	if err != nil {
		fmt.Printf("Error create patient chaincode: %s", err.Error())
		return
	}

	if err := chaincode.Start(); err != nil {
		fmt.Printf("Error starting patient chaincode: %s", err.Error())
	}
}    



