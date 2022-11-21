import React, { useContext, Fragment } from "react";
import { NavLink } from "react-router-dom";
import {
  Accordion,
  useAccordionToggle,
  AccordionContext,
} from "react-bootstrap";
import "./Sidebar.scss";
import * as FaIcons from "react-icons/fa";

function ContextAwareToggle({ children, eventKey, callback }) {
  const currentEventKey = useContext(AccordionContext);
  const decoratedOnClick = useAccordionToggle(
    eventKey,
    () => callback && callback(eventKey)
  );

  //  const isCurrentEventKey = currentEventKey === eventKey;
  return (
    <button
      type="button"
      variant="link"
      className="menu__item px-2 py-2 border-0"
      style={{ backgroundColor: "white" }}
      onClick={decoratedOnClick}
    >
      {children}
    </button>
  );
}


const SidebarAdmin = () => {
  return (
    <Fragment>
      <nav id="sidebar">
        <a className="sidebar--header" href="/">
          <div className="siderbar-header__logo">
            <img
              className="sidebar--logo__icon"
              src={require("../../assets/logo/logo.png").default}
              alt=""
            ></img>
          </div>
          <div className="siderbar--logo_title">
            <h3>EHRchain</h3>
          </div>
        </a>

        <ul className="sidebar--menu">
          <li className="sidebar--menu-child">
            <Accordion className="px-0 py-0">
              <ContextAwareToggle eventKey="0">
                <NavLink to="/">
                  <span>
                    <FaIcons.FaHome></FaIcons.FaHome>
                  </span>
                  Dashboard
                </NavLink>
              </ContextAwareToggle>
            </Accordion>
          </li>

          <li className="">
            <Accordion className="px-0 py-0">
              <ContextAwareToggle eventKey="0">
                <NavLink to="/patients-list">
                  <span>
                    <FaIcons.FaClipboardList></FaIcons.FaClipboardList>
                  </span>
                  Patients
                </NavLink>
              </ContextAwareToggle>
            </Accordion>
          </li>

          <li className="">
            <Accordion className="px-0 py-0">
              <ContextAwareToggle eventKey="0">
                <NavLink to="/doctors-list">
                  <span>
                    <FaIcons.FaUserMd></FaIcons.FaUserMd>
                  </span>
                  Doctors
                </NavLink>
              </ContextAwareToggle>
            </Accordion>
          </li>
        </ul>
      </nav>
    </Fragment>
  );
};

export default SidebarAdmin;
