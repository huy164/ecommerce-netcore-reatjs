import React from "react";
import "./style.css";

export default function Index() {
  return (
    <div className="social">
      <ul>
        <li>
          <a
            href="https://www.facebook.com/quanghuyvo16042001"
            title="Lavender"
            className="blue"
          >
            <span>
              <i className="fab fa-facebook icon-facebook" />
            </span>
          </a>
        </li>
        <li>
          <a
            href="https://www.youtube.com/channel/UCLbranT71hBLT7J0U8SkcrA"
            title="Youtube Khanh"
            className="red"
          >
            <span>
              <i className="fab fa-youtube icon-youtube" />
            </span>
          </a>
        </li>
        <li>
          <a
            href="https://www.instagram.com"
            title="Instagram Khanhzum"
            className="rainbow"
          >
            <span>
              <i className="fab fa-instagram icon-instagram" />
            </span>
          </a>
        </li>
      </ul>
    </div>
  );
}
