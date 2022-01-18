import './App.scss'
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Header from "./components/Header";
import Sidebar from "./components/Sidebar";
import ProductList from "./components/ProductList";
import Login from "./components/Login";
import useToken from "./hooks/useToken";
import Main from "./components/Main";
import NotFound from "./components/NotFound";
import Auth from "./api/Auth";
import { CartContextProvider } from "./hooks/CartContext";
import { useEffect } from 'react';

function App(props) {
  const { token, setToken } = useToken();
  const auth = new Auth(token, setToken);
  const loginComponent = (props) => (
    <Login {...props} uri="/login" auth={auth} history={props.history} />
  );
  const MainComponent = (props) => <Main token={token} auth={auth} />;
  console.log(window.location)
  return (   
    <Router>
      <div className="containers"> 
        < div className="flex-grow flex-shrink-0">
        <Header history={props.history} userInfo={token} auth={auth} />
          <div className="main_container">
          <Sidebar></Sidebar>
          <CartContextProvider>        
            <Routes>
              <Route path="/members" element={<Main token={token} auth={auth} />} />
              <Route path="/temp" element={NotFound} />
              <Route path="*" element={NotFound} />
            </Routes>
          </CartContextProvider>   
          </div>
        </div>
        <Routes>
        <Route
          path="/"
          element={<Login {...props} uri="/login" auth={auth}/>
          }
        />
        <Route
          path="/login"
          element={<Login {...props} uri="/login" auth={auth}/>
          }
        />
        </Routes>
      </div> 
    </Router>
  );
}

export default App;
