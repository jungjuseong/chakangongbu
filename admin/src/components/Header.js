import "./Header.scss"
import { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import Button from "./Button";
import Logo from "./../images/main_logo.png";


const Header = ({ userInfo, auth, history }) => {
  const [open, setOpen] = useState(false);
  const [loggedIn, setLoggedIn] = useState(false);

  const handleClick = (event) => {
    const target = document.querySelector("#headerUserMenu");
    const withinBoundaries = event.composedPath().includes(target);
    if (!withinBoundaries) {
      if (open) setOpen(false);
    }
  };

  const handleLogout = async (e) => {
    await auth.logoutUser({ refreshToken: userInfo.refreshToken });
    if (open) setOpen(false);
    history.push("/members");
  };

  useEffect(() => {
    setLoggedIn(userInfo ? true : false);
  }, [userInfo]);

  useEffect(() => {
    window.addEventListener("click", handleClick);
    // cleanup this component
    return () => {
      window.removeEventListener("click", handleClick);
    };
  });

  return (
    <div>
      <nav className="header">
          <div className="main_logo">
            <Link to="/members"><img src={Logo} alt=""></img></Link>
          </div>
          <div className="header_menu">
            <button className="event">
              이벤트
            </button>
            <button className="info">
              공지사항
            </button>
            <button className="quizbank">
              문제은행
            </button>
            <Link className="menu_logout" to={"/login"}>
              로그아웃
            </Link>
          </div>
      </nav>
    </div>
  );
};

export default Header;
