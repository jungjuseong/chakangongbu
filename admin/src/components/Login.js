import './Login.scss'
import { useState } from "react";
import PropTypes from "prop-types";
import logo from "../images/login_logo.png";
import { useNavigate } from 'react-router';

const Login = ({ uri, auth }) => {
  const [username, setUserName] = useState();
  const [password, setPassword] = useState();
  const [errMsg, setErrMsg] = useState();
  const navigate = useNavigate()
  const cancel = () => {
    navigate('/members')
  };

  const handleSubmit = async (e) => {
    // e.preventDefault();
    // const res = await auth.loginUser({
    //   username,
    //   password,
    // });
    // if (res && res.success) {
    //   setErrMsg(null);
    // } else {
    //   setErrMsg(
    //     res && typeof res === "string" ? res : "Invalid Username/Password"
    //   );
    // }
  };
  return (
    <div className='background'>
      <div className="login_container">
        <div className='login_logo'>
          <img src={logo} alt=''/>
        </div>
        <form className="login_form" onSubmit={handleSubmit}>
          <div className="rounded-md shadow-sm -space-y-px">
            <div>
              <div>
                아이디
              </div>
              <span
                className="text-red-500"
                style={{ dispay: errMsg ? "block" : "none" }}
              >
                {errMsg}
              </span>
              <label htmlFor="username" className="sr-only">
                
              </label>
              <input
                id="username"
                name="username"
                type="username"
                autoComplete="username"
                required
                className="input"
                onChange={(e) => setUserName(e.target.value)}
              />
            </div>
            <div>
              <div>
                비밀번호
              </div>
              <label htmlFor="password" className="sr-only">
                
              </label>
              <input
                id="password"
                name="password"
                type="password"
                autoComplete="current-password"
                required
                className="input"
                onChange={(e) => setPassword(e.target.value)}
              />
            </div>
          </div>

          <div className="submit">
            <div className="submit_remember">
            <label className="remember">
              <input type="checkbox" className='remember_btn' />
              아이디 기억하기
            </label>
              <button
                // type="submit"
                className="submit_btn"
                onClick={cancel}
              >
              </button>
            </div>
          </div>
          <div className="signup_find">
              <button
                type="button"
                onClick={()=>{}}
                className="sign_up"
              >
                회원가입 하기
              </button>
              <button
                type="button"
                onClick={()=>{}}
                className="find_password"
              >
                비밀번호/아이디 찾기
              </button>
            </div>
        </form>
      </div>
    </div>
  );
};

Login.propTypes = {
  auth: PropTypes.object.isRequired,
};

export default Login;
