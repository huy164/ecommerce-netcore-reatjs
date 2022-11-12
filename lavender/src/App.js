import "./App.css";
import routes from "./Common/Router/routes.js";
import { ToastContainer } from "react-toastify";
import { Switch, Route, withRouter, Link } from "react-router-dom";
import Header from "./Components/Header";
import Footer from "./Components/Footer";
import React, { useEffect } from "react";
import { Provider } from "react-redux";
import configureStore from "./Components/redux/configureStore";
import LeftMenu from "./Components/Admin/LeftMenu";
import CookieConsent from "react-cookie-consent";
import InitData from "./InitData";
import { Helmet } from "react-helmet";


const store = configureStore();
function App(props) {
  const showContentMenus = (routes) => {
    var result = null;
    if (routes.length) {
      result = routes.map((value, key) => {
        let keyRan = key;
        if (value.path === "/cart") keyRan = Date.now();
        return (
          <Route
            path={value.path}
            exact={value.exact}
            component={value.main}
            keyProp={key}
            key={keyRan}
          ></Route>
        );
      });
    }
    return <Switch>{result}</Switch>;
  };

  useEffect(() => {
  }, []);

  return (
    <Provider store={store}>
      <ToastContainer />

      <InitData></InitData>
      <div>
        {
        // props.location.pathname === "/" ? (
        //   <Helmet
        //     bodyAttributes={{ style: "background-color : #6b0a0a" }}
        //   ></Helmet>
        // ) :
        (
          <Helmet
            bodyAttributes={{ style: "background-color : #fff" }}
          ></Helmet>
        )}
        {props.location.pathname.includes("/admin") ? (
          <LeftMenu>Home</LeftMenu>
        ) : (
          <Header />
        )}
        {showContentMenus(routes)}
        {props.location.pathname.includes("/admin") ? null : <Footer />}
      </div>
      {!localStorage.getItem("acceptCookie") && (
        <CookieConsent
          debug={true}
          location="bottom"
          expires={60}
          onAccept={() => {
            localStorage.setItem("acceptCookie", true);
          }}
          buttonText="Có tôi đồng ý!"
        >
          Trang này sử dụng cookie. Xem thêm{" "}
          <Link to="/privacy"> chính sách bảo mật </Link> ở đây.
        </CookieConsent>
      )}
    </Provider>
  );
}

export default withRouter(App);
