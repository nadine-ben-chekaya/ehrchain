import { Fragment, useState, useRef, useEffect  } from 'react';
import './App.scss';
import SidebarAdmin from './components/SidebarAdmin/SidebarAdmin';
import SidebarPatient from './components/SidebarPatient/SidebarPatient';
import SidebarDoctor from './components/SidebarDoctor/SidebarDoctor';

import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import DashboardAdmin from './pages/Dashboard/DashboardAdmin';
import DashboardDoctor from './pages/Dashboard/DashboardDoctor';
import DashboardPatient from './pages/Dashboard/DashboardPatient';

import Header from './components/Header/Header';
import PatientData from './components/PatientData/PatientData';

import AdminLogin from './pages/Login/AdminLogin';
import PatientLogin from './pages/Login/PatientLogin';
import DoctorLogin from './pages/Login/DoctorLogin';


import DoctorsList from './components/DoctorsListComponents/DoctorsList';
import PatientsList from './components/PatientsListComponents/PatientsList';
import CaregiversList from './components/CaregiversComponents/CaregiversList';


import PermissionsList from './components/PermissionsListComponents/PermissionsList';
import PdfReportsList from './components/PdfReportsComponents/PdfReportsList';


function App() {
  
  return (
            <div>
              

                <Route path='/' exact component={DashboardAdmin} />
                <Route path='/dashboard-patient' exact component={DashboardPatient} />
                <Route path='/dashboard-doctor' exact component={DashboardDoctor} />

                <Route path='/view-data' exact component={PatientData} />
                <Route path='/doctors-list' exact component={DoctorsList} />
                <Route path='/patients-list' exact component={PatientsList} />
                <Route path='/my-caregivers' exact component={CaregiversList} />
                <Route path='/my-permissions' exact component={PatientData} />
                <Route path='/pdf-reports' exact component={PdfReportsList} />

                <Route path="/admin-login"  exact component={AdminLogin} />
                <Route path="/patient-login" exact component={PatientLogin} />
                <Route path="/doctor-login" exact component={DoctorLogin}/>

           </div>
              

  );
}

export default App;
