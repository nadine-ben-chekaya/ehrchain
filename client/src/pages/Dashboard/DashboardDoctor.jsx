import React, { Fragment } from "react";
import { FaHome, FaFileAlt } from "react-icons/fa";

import { Breadcrumb, Card } from "react-bootstrap";

import "./Dashboard.scss";

const DashboardDoctor = () => {
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
                    Dashboard
                  </Breadcrumb.Item>
                </Breadcrumb>
              </div>
            </div>
          </section>
          <section className="section--daily-statistics">
            <div className="row"></div>
          </section>
        </div>
      </div>
    </Fragment>
  );
};

export default DashboardDoctor;
