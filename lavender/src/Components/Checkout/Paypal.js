import React, { Component } from 'react';
import { PayPalButtons } from "@paypal/react-paypal-js";

class Paypal extends Component {
    render() {
        return (
            <>
                <PayPalButtons
                    createOrder={(data, actions) => {
                        return actions.order.create({
                            intent: "CAPTURE",
                            purchase_units: [
                                {
                                    description: "thanh toán đơn hàng trên lavender",
                                    amount: {
                                        currency_code: "USD",
                                        value: (this.props.tongcong/ 1000000 / 0.023).toFixed()
                                        //chuyển vnd sang usd tofixed để tránh lỗi khi giá trị sau convert bị lẻ
                                    }
                                },
                            ]
                        });
                    }}
                    onApprove={async (data, actions) => {
                        const order = await actions.order.capture();
                        this.props.muaHang();
                        console.log("successfully " + order);
                    }}
                    onError={(err) => {
                        console.error(err);
                    }}
                />
            </>

        );
    }
}

export default Paypal;