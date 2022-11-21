import React, { useState, useEffect } from "react";
import { Modal, Button, Table } from "react-bootstrap";
import { FaPen } from "react-icons/fa";
import "./PatientData.scss";
import { FaHome } from "react-icons/fa";
import { Fragment } from "react";
import { Breadcrumb, Card } from "react-bootstrap";

const BioDoctor = () => {
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
                    Bio Doctor
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
                      <Card.Header>Share data with doctor</Card.Header>
                      <Card.Body>
                        <div className="vaccinate-appoinment__content">
                          <div className="vaccinated-appoinment--header">
                            <div className="row">
                              <div className="offset-md-1 col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                <div className="category">
                                  <span>Category</span>

                                  <select name="category" className="select">
                                    <option value="handp">HandP</option>
                                    <option value="handp">HandP</option>
                                    <option value="handp">HandP</option>
                                    <option value="handp">HandP</option>
                                  </select>
                                </div>
                                <br></br>
                                <div className="category">
                                  <span>Hospital</span>

                                  <select name="category" className="select">
                                    <option value="handp">
                                      Select Hospital
                                    </option>
                                    <option value="handp">HandP</option>
                                    <option value="handp">HandP</option>
                                    <option value="handp">HandP</option>
                                  </select>
                                </div>
                                <br></br>
                                <div className="category">
                                  <span>Doctor</span>

                                  <select name="category" className="select">
                                    <option value="handp">Select Doctor</option>
                                    <option value="handp">Alex MOREZ</option>
                                    <option value="handp">HandP</option>
                                    <option value="handp">HandP</option>
                                  </select>
                                </div>
                                <br></br>
                                <div className="category">
                                  <span>Data Rights</span>

                                  <select name="category" className="select">
                                    <option value="handp"></option>
                                    <option value="handp">HandP</option>
                                    <option value="handp">HandP</option>
                                    <option value="handp">HandP</option>
                                  </select>
                                </div>
                                <br></br>
                                <div className="category">
                                  <span>From</span>

                                  <input
                                    className="select"
                                    type="date"
                                    id="start"
                                    name="trip-start"
                                    value="2018-07-22"
                                    min="2022-01-01"
                                    max="2022-12-31"
                                  ></input>
                                </div>
                                <br></br>
                                <div className="category">
                                  <span>To</span>

                                  <input
                                    className="select"
                                    type="date"
                                    id="start"
                                    name="trip-start"
                                    value="2018-07-22"
                                    min="2022-01-01"
                                    max="2022-12-31"
                                  ></input>
                                </div>
                                <button className="share-btn">
                                  Share Data
                                </button>
                              </div>
                            </div>
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

export default BioDoctor;
