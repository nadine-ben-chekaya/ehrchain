import React, { useState, useEffect } from "react";
import { Modal, Button, Table } from "react-bootstrap";
import { FaPen } from "react-icons/fa";
import EditPermissionsList from "./EditPermissionsList";
import "./PermissionsList.scss";
import { FaHome, FaSearch } from "react-icons/fa";
import { GoPlus } from "react-icons/go";
import { HiMinus } from "react-icons/hi";
import { Fragment } from "react";

import {
  Breadcrumb,
  Card,
  FormControl,
  InputGroup,
  Pagination,
} from "react-bootstrap";
import AddPermissionModal from "../ModalPermission/AddPermissionModal";

const PermissionsList = () => {
  const [vaccinatedPeople, setVaccinatePeople] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [show, setShow] = useState(false);
  const handleClose = () => setShow(false);

  const getVaccinatedPeopleList = () => {
    fetch("./data/vaccinate-user-table.json")
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
                    My permissions
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
                      <Card.Header>Permissions given by me</Card.Header>
                      <Card.Body>
                        <div className="vaccinate-appoinment__content">
                          <div className="vaccinated-appoinment--header">
                            <div className="row">
                              <div className="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <AddPermissionModal></AddPermissionModal>
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
                                    <th>Doctor ID</th>
                                    <th>Category</th>
                                    <th>Right</th>
                                    <th>Filename</th>
                                    <th>From</th>
                                    <th>To</th>
                                    <th>Action</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  {vaccinatedPeople &&
                                    vaccinatedPeople.length > 0 &&
                                    vaccinatedPeople.map((vaccinate) => (
                                      <tr key={vaccinate.id}>
                                        <td>{vaccinate.id}</td>
                                        <td>{vaccinate.name}</td>
                                        <td>{vaccinate.email}</td>
                                        <td>{vaccinate.gender}</td>
                                        <td>{vaccinate.date}</td>
                                        <td>{vaccinate.phone}</td>
                                        <td>
                                          <a
                                            className="edit-btn action-btn btn"
                                            onClick={() => setShow(true)}
                                          >
                                            <GoPlus></GoPlus>
                                          </a>
                                          <a
                                            className="delete-btn action-btn btn"
                                            onClick={() => setShow(true)}
                                          >
                                            <HiMinus></HiMinus>
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
                                  <EditPermissionsList></EditPermissionsList>
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
    </Fragment>
  );
};

export default PermissionsList;
