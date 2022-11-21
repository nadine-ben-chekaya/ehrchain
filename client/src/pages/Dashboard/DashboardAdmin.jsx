import React, { Fragment, useState, useRef, useEffect } from "react";
import { FaHome, FaFileAlt } from "react-icons/fa";

import { Breadcrumb, Card } from "react-bootstrap";

import {useHistory} from "react-router-dom";

import Header from "../../components/Header/Header";

import SidebarAdmin from "../../components/SidebarAdmin/SidebarAdmin";

import "./Dashboard.scss";

const DashboardAdmin = () => {
  const history = useHistory()
  const [logout, setLogout] = useState(false);

  useEffect(()=> {
    if(!localStorage.getItem('auth')) history.push('/admin-login')
  },[])
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
                    Dashboard
                  </Breadcrumb.Item>
                </Breadcrumb>
              </div>
            </div>
          </section>
          <section className="section--daily-statistics">
            <div className="row">
              <div className="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-3">
                <Card className="card-style">
                  <div className="card--content box-shadow">
                    <div className="statistics-card clearfix">
                      <div className="card-icon shadow-primary bg-purple float-left">
                        <FaFileAlt></FaFileAlt>
                      </div>
                      <div className="card-content float-right">
                        <h6>Total Patients</h6>
                        <h4 className="float-right">650</h4>
                      </div>
                    </div>
                    <div className="card-chart">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 1440 320"
                      >
                        <path
                          fill="rgba(103, 119, 239,.8)"
                          fillOpacity="1"
                          d="M0,96L288,32L576,192L864,96L1152,128L1440,64L1440,320L1152,320L864,320L576,320L288,320L0,320Z"
                        ></path>
                      </svg>
                    </div>
                  </div>
                </Card>
              </div>
              <div className="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-3">
                <Card className="card-style">
                  <div className="card--content box-shadow">
                    <div className="statistics-card clearfix">
                      <div className="card-icon bg-shadowGreen float-left">
                        <FaFileAlt></FaFileAlt>
                      </div>
                      <div className="card-content float-right">
                        <h6>Total Doctors</h6>
                        <h4 className="float-right">450</h4>
                      </div>
                    </div>
                    <div className="card-chart">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 1440 320"
                      >
                        <path
                          fill="rgba(0, 203, 169,.8)"
                          fillOpacity="1"
                          d="M0,96L288,32L576,192L864,96L1152,128L1440,64L1440,320L1152,320L864,320L576,320L288,320L0,320Z"
                        ></path>
                      </svg>
                    </div>
                  </div>
                </Card>
              </div>
            </div>
          </section>
        </div>
      </div>
      </div>
      </main>
      </div>
      </Fragment>
    </Fragment>
  );
};

export default DashboardAdmin;
