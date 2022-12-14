import React, { Component } from 'react'
import "./Footer.css";
import { Link } from 'react-router-dom';

export default class Footer extends Component {
    render() {
        return (
          <footer id="footer">
            <div className="row">
              <div className="col-md-3 item">
                <h3>Lavender</h3>
                    <p>
                      Khu phố 6 <br />
                      Phường Linh Trung,
                      <br />
                      Thành phố Thủ Đức <br />
                      <br />
                      <strong>Phone:</strong> +1 5589 55488 55
                      <br />
                      <strong>Email:</strong> info@example.com
                      <br />
                    </p>
              </div>
              <div className="col-md-3 item">
                <h3>Services</h3>
                <ul>
                   <li><a >Web Design</a></li>
                  <li><a >Web Development</a></li>
                  <li><a  >Product Management</a></li>
                  <li><a >Marketing</a></li>
                  <li><a >Graphic Design</a></li>
                </ul>
              </div>
              <div className="col-md-3 item">
                <h3>About</h3>
                <ul>
                  <li><Link to = "/privacy" style={{color: 'white'}}>Các điều khoản dịch vụ</Link></li>
                  <li><a style={{color: 'white'}} href="#">Team</a></li>
                  <li><a style={{color: 'white'}} href="#">Careers</a></li>
                </ul>
              </div>
              <div className="col-md-3 item text">
                <h3>Hotline</h3>
                    <ul>
                      <li>
                        <i className="bx bx-chevron-right" />{" "}
                        <a style={{color: 'white'}} href="tel:0914630145" >Gọi mua hàng: 0914630145</a>
                      </li>
                      <li>
                        <i className="bx bx-chevron-right" />{" "}
                        <a style={{color: 'white'}} href="tel:01423456789" >Gọi khiếu nại</a>
                      </li>
                      <li>
                        <i className="bx bx-chevron-right" />{" "}
                        <a style={{color: 'white'}} href="tel:0123456789" >Gọi bảo hành</a>
                      </li>
                      <li>
                        <i className="bx bx-chevron-right" />{" "}
                        <a style={{color: 'white'}} href="https://www.facebook.com/bii.nhok.1" >Bảo trợ truyền thông</a>
                      </li>
                    </ul>
                  </div>
              </div>              
        </footer>

     
        )
    }
}
