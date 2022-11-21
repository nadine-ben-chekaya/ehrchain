import React, { useState, useEffect } from "react";
import { Modal, Button, Table } from "react-bootstrap";
import { FaPen } from "react-icons/fa";
import EditDoctorsList from "./EditDoctorsList";
import SidebarAdmin from "../SidebarAdmin/SidebarAdmin";
import Header from "../Header/Header";
import "./DoctorsList.scss";
import { FaHome, FaSearch } from "react-icons/fa";
import { Fragment } from "react";
import {
  Breadcrumb,
  Card,
  FormControl,
  InputGroup,
  Pagination,
} from "react-bootstrap";
import AddDoctorModal from "../ModalDoctor/AddDoctorModal";

const DoctorsList = () => {
  const [vaccinatedPeople, setVaccinatePeople] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [show, setShow] = useState(false);
  const handleClose = () => setShow(false);

  const getVaccinatedPeopleList = () => {
    fetch("./data/doctor-list.json")
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw response;
      })
      .then((vaccinatedPeople) => {
        setVaccinatePeople(vaccinatedPeople);
      })
      .catch((error) => {
        console.error("Error fetching data", error);
        setError(error);
      })
      .finally(() => {
        setLoading(false);
      });
  };

  useEffect(() => {
    getVaccinatedPeopleList();
  }, []);

  if (loading) return "Loading..";
  if (error) return "Error !";
  return (
    <Fragment>
      <Fragment>
        <div className="wrapper">
          <aside className="side-panel"> 
          {/* Conditions on displaying the sidebar based on user roles (if admin, if patient, if doctor) */}
          <SidebarAdmin></SidebarAdmin>
          {/*<SidebarPatient></SidebarPatient>*/}
          {/* <SidebarDoctor></SidebarDoctor> */}
          </aside>
          <main className="main-panel">
            <Header></Header>
            <div className="container-fluid">
      <div id="content-dashboard">
        <div className="container-fluid">
          <section className="block-header">
            <div className="row">
              <div className="col-xs-12 col-lg-12 col-md-12 col-sm-12">
                <Breadcrumb className="breadcrumb-style">
                  <Breadcrumb.Item>Dashboard</Breadcrumb.Item>
                  <Breadcrumb.Item>
                    <FaHome></FaHome>
                  </Breadcrumb.Item>
                  <Breadcrumb.Item>Home</Breadcrumb.Item>
                  <Breadcrumb.Item active href="/">
                    Doctors List
                  </Breadcrumb.Item>
                </Breadcrumb>
              </div>
            </div>
          </section>
          <div id="content-view-appoinment">
            <div className="container-fluid">
              <section className="section--vaccinated-appoinment">
                <div className="row">
                  <div className="col-xs-12 col-lg-12 col-md-12 col-sm-12">
                    <Card className="vaccinate-appoinment__card card-style">
                      <Card.Header>Doctors List</Card.Header>
                      <Card.Body>
                        <div className="vaccinate-appoinment__content">
                          <div className="vaccinated-appoinment--header">
                            <div className="row">
                              <div className="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <AddDoctorModal></AddDoctorModal>
                              </div>
                              <div className="offset-md-3 col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                <div className="vaccinate-appoinment--search">
                                  <InputGroup className="mb-3">
                                    <FormControl
                                      placeholder="Search"
                                      aria-label="Search"
                                      aria-describedby="basic-addon2"
                                    />
                                    <InputGroup.Append>
                                      <Button
                                        variant="outline-secondary"
                                        className="search-btn"
                                      >
                                        <FaSearch></FaSearch>
                                      </Button>
                                    </InputGroup.Append>
                                  </InputGroup>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div className="vaccinate-appoinment--list">
                            <div>
                              <Table responsive striped bordered hover>
                                <thead>
                                  <tr>
                                    <th>HospitalId</th>
                                    <th>FirstName</th>
                                    <th>LastName</th>
                                    <th>Speciality</th>
                                    <th>Phone Number</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  {vaccinatedPeople &&
                                    vaccinatedPeople.length > 0 &&
                                    vaccinatedPeople.map((vaccinate) => (
                                      <tr key={vaccinate.firstName}>
                                        <td>{vaccinate.hospitalId}</td>
                                        <td>{vaccinate.firstName}</td>
                                        <td>{vaccinate.lastName}</td>
                                        <td>{vaccinate.speciality}</td>
                                        <td>{vaccinate.phoneNumber}</td>

                                        <td>
                                          <a
                                            className="edit-btn action-btn btn"
                                            onClick={() => setShow(true)}
                                          >
                                            <FaPen></FaPen>
                                          </a>
                                        </td>
                                      </tr>
                                    ))}
                                </tbody>
                              </Table>

                              <Modal
                                className="vaccinate-appoinment-edit-modal--content"
                                show={show}
                                backdrop="static"
                                keyboard={false}
                                onHide={() => setShow(false)}
                                aria-labelledby="contained-modal-title-vcenter"
                                centered
                              >
                                <Modal.Header closeButton>
                                  <Modal.Title id="example-custom-modal-styling-title">
                                    Edit Vaccinate
                                  </Modal.Title>
                                </Modal.Header>
                                <Modal.Body>
                                  <EditDoctorsList></EditDoctorsList>
                                </Modal.Body>
                                <Modal.Footer>
                                  <Button
                                    className="close-btn"
                                    variant="danger"
                                    onClick={handleClose}
                                  >
                                    Close
                                  </Button>
                                  <Button
                                    className="submit-btn"
                                    variant="primary"
                                    type="submit"
                                  >
                                    Submit
                                  </Button>
                                </Modal.Footer>
                              </Modal>
                            </div>
                          </div>
                          <div className="vaccinate-appoinment--pagination float-right">
                            <Pagination>
                              <Pagination.First />
                              <Pagination.Prev />
                              <Pagination.Item active>{1}</Pagination.Item>
                              <Pagination.Ellipsis />

                              <Pagination.Item>{2}</Pagination.Item>
                              <Pagination.Item>{3}</Pagination.Item>
                              <Pagination.Item>{4}</Pagination.Item>
                              <Pagination.Item>{5}</Pagination.Item>
                              <Pagination.Item>{6}</Pagination.Item>

                              <Pagination.Ellipsis />
                              <Pagination.Item>{20}</Pagination.Item>
                              <Pagination.Next />
                              <Pagination.Last />
                            </Pagination>
                          </div>
                        </div>
                      </Card.Body>
                    </Card>
                  </div>
                </div>
              </section>
            </div>
          </div>
        </div>
      </div>
      </div>
      </main>
      </div>
      </Fragment>
    </Fragment>
  );
};

export default DoctorsList;
