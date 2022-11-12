import React, { Component } from 'react'
import "./QuanLyDonHang.css";

export default class Chitiethoadon extends Component {
    render() {
        return (
            <div>
        <section className="ui-card" id="order_card">
          <header className="ui-card__header">
            <div className="ui-stack ui-stack--wrap">
              <div className="ui-stack-item ui-stack-item--fill">
                <div className="ui-stack ui-stack--wrap ui-stack--alignment-center">
                  <h2 className="ui-heading">Chi tiết đơn hàng:</h2>
                  <h2># mã hóa đơn</h2>
                </div>
              </div>
            </div>
          </header>
          <div id="order-line-items">
            <div className="next-card__section next-card__section--no-vertical-spacing">
              <table className="table--no-side-padding table--divided">
                <tbody>
                  <tr className="orders-line-item">
                    <td className="orders-line-item__image hide-when-printing">
                      <div className="aspect-ratio aspect-ratio--square aspect-ratio--square--50">
                        <img src /> cái hình
                      </div>
                    </td>
                    <td className="orders-line-item__description">
                      <a href="/admin/products/24057273/variants/56485756" target="_blank" rel="noreferrer noopener">Iphone 13</a>
                      <p className="type--subdued">516GB / Xanh</p>
                    </td>
                    <td className="orders-line-item__price">
                      22.390.000₫
                    </td>
                    <td className="orders-line-item__times-sign">
                      ×
                    </td>
                    <td className="orders-line-item__quantity">
                      1
                    </td>
                    <td className="orders-line-item__total">
                      22.390.000₫
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>                              
          </div>
          <div className="ui-card__section">
            <div className="ui-stack ui-stack--wrap ui-stack--distribution-fill">
              <div id="transaction_summary">
                <table className="table--nested table--no-border type--right">
                  <tbody>
                    <tr>
                      <td />
                      <td />
                      <td />
                      <td className="type--subdued">Giá</td>
                      <td>22.390.000₫</td>
                    </tr>
                    <tr>
                      <td />
                      <td />
                      <td />
                      <td className="type--subdued">
                        Phí giao hàng haha 
                      </td>
                      <td>
                        40.000₫
                      </td>
                    </tr>
                    <tr>
                      <td><strong>Tổng cộng</strong></td>
                      <td><strong>22.390.000₫</strong></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div className="ui-card__section" id="shipping-label-card" refresh="order-actions">
            <div className="khachhang" id="chuabiet" refresh="order-actions">
              <div>
                Họ tên khách hàng: 
                Nguyễn Văn A
              </div>
              <div>
                Số điện thoại: 
                Nguyễn Văn A
              </div>
              <div>
                Email: 
                a@gmail.com
              </div>
              <div>
                Ngày mua: 
                20/10/2021
              </div>
              <div>
                Địa chỉ giao hàng: 
                TP.HCM
              </div>
              <div>
                Mã vận chuyển: 
                VC001
              </div>
            </div>
          </div>
          <div className="ui-card__section" id="shipping-label-card" refresh="order-actions">
            <div className>
              <h3 className>
                Trạng thái giao hàng:
                Đã giao hàng
              </h3>
            </div>
            <div>
              <h3 className>
                Trạng thái thanh toán :
                Đã thanh toán
              </h3>
            </div>
          </div>
        </section>
      </div>
        )
    }
}
