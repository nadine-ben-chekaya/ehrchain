import './Login.scss';
import logo from "../../assets/logo/logo.png";

import React, {Fragment, useState, useRef, useEffect } from 'react';
import {useHistory} from "react-router-dom"

function PatientLogin() {
    const history = useHistory()
    
    const [username, setUserName] = useState();
    const [orgName, setOrgname] = useState();

    useEffect(()=> {
        if(localStorage.getItem('auth')) history.push('/')
    },[])
    
    const handleSubmit = async e => {
        e.preventDefault();
        var credential = {username,
                          orgName
                         }
        //console.log(`Hello data: ${credential.orgname}`) 
        const res = await fetch('http://localhost:4000/users/login', {
          method: 'POST',
          headers: {
            'Content-type': 'application/json'
          },
          body: JSON.stringify(credential),
        })
          //.then(data => data.json())
          const data = await res.json()
          if (data.success ) {
            //console.log("before localestorage")
            localStorage.setItem('token' , data['token'])
            localStorage.setItem('auth', data.success )

            history.push('/')
            
          } else {
            console.log('error fetch token')    
         }
         console.log('Hello') 
         
       
    }
    return (
    <Fragment>
      <div className="wrapper">
        <div className="main">
            <div className="sub-main">
                <div>
                    <img src={logo} alt="logo" className="logo" />
                    <div >
                        <h1>Patient Login</h1>
                        <h5>Please enter your credentials</h5>
                        <div className='form'>
                            <div className="first-input">
                                <label>Username</label><br></br>
                                <input type="text" placeholder="Your username" className="input" onChange={e => setUserName(e.target.value)}/>
                            </div>
                            <div className="second-input">
                                <label>Password</label><br></br>

                                <input type="password" placeholder="Your password" className="input" onChange={e => setOrgname(e.target.value)}/>
                            </div>
                        </div>
                        <button className='button'  onClick={handleSubmit}>Login</button>
                    </div>
                </div>
                <div className='link'>
                    <button className='btn'>
                        <a href='/admin-login'>Admin Login</a>
                    </button>
                    <button className='btn'>
                        <a href='/doctor-login'>Doctor Login</a>
                    </button>
                </div>



            </div>
        </div>
      </div>
    </Fragment>
    );
}

export default PatientLogin;