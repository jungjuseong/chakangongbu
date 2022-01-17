import './Main.scss'
import { useEffect, useState } from "react";
import { Link, useHistory, BrowserRouter as Router, Route } from "react-router-dom";
import Header from "./Header";
import Sidebar from "./Sidebar";
import NotFound from "./NotFound";
import Cart from "./Cart";
import Member from './Member';

const Main = ({token, auth }) => {


  useEffect(() => {

  }, []);


  return (
    <>
        <Member auth={auth}/>
    </>
  );
};

export default Main;
