import './Login.scss';
import logo from "../../assets/logo/logo.png";

function DoctorLogin() {
    return (
        <div className="main">
            <div className="sub-main">
                <div>
                    <img src={logo} alt="logo" className="logo" />
                    <div >
                        <h1>Doctor Login</h1>
                        <h5>Please enter your credentials</h5>
                        <div className='form'>
                            <div className="first-input">
                                <label>Username</label><br></br>
                                <input type="text" placeholder="Your username" className="input" />
                            </div>
                            <div className="second-input">
                                <label>Password</label><br></br>

                                <input type="password" placeholder="Your password" className="input" />
                            </div>
                        </div>
                        <button className='button'>Login</button>
                    </div>
                </div>
                <div className='link'>
                    <button className='btn'>
                        <a href='/admin-login'>Admin Login</a>
                    </button>
                    <button className='btn'>
                        <a href='/patient-login'>Patient Login</a>
                    </button>
                </div>


            </div>
        </div>
    );
}

export default DoctorLogin;