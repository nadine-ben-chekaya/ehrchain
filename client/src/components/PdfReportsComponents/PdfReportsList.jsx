import React, { useState, useEffect } from "react";
import { Modal, Button, Table } from "react-bootstrap";
import { FaPen, FaHome, FaSearch } from "react-icons/fa";
import { GrDownload } from "react-icons/gr";

import { Fragment } from "react";
import {
  Breadcrumb,
  Card,
  FormControl,
  InputGroup,
  Pagination,
} from "react-bootstrap";

const PdfReportsList = () => {
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
                    PDF Reports
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
                      <Card.Header>PDF Reports List</Card.Header>
                      <Card.Body>
                        <div className="vaccinate-appoinment__content">
                          <div className="vaccinated-appoinment--header">
                            <div className="row">
                              <div className="col-xs-12 col-sm-12 col-md-6 col-lg-6"></div>
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
                                    <th>#</th>
                                    <th>Patient Name</th>
                                    <th>Email</th>
                                    <th>Gender</th>
                                    <th>Date</th>
                                    <th>Phone</th>
                                    <th>Doctor</th>
                                    <th>Vaccine</th>
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
                                        <td>{vaccinate.doctor}</td>
                                        <td>{vaccinate.vaccine}</td>
                                        <td>
                                          <a
                                            className="edit-btn action-btn btn"
                                            onClick={() => setShow(true)}
                                          >
                                            <GrDownload></GrDownload>
                                          </a>
                                        </td>
                                      </tr>
                                    ))}
                                </tbody>
                              </Table>
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

export default PdfReportsList;
