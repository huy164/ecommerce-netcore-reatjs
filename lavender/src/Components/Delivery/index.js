import { useState } from 'react';
import * as delivery from '../apis/delivery';
import * as myToast from "../../Common/helper/toastHelper";
const Delivery = (props) => {
    const [distance, setDistance] = useState(0);
    const [city, setCity] = useState("");
    const [cost, setCost] = useState(0);
    const [countPress, setCountPress] = useState(0);


    function calDistance() {
        var origin = "10.869724,106.803124";
        var destination = "";
        delivery.GeoCoding(city)
            .then(function (res) {
                destination = res.data[0].lat.toString() + "," + res.data[0].lon.toString();
                setCity(res.data[0].display_name.toString());
                delivery.calDistance(origin, destination)
                    .then(function (res) {
                        setDistance((res.data.rows[0].elements[0].distance.value / 1000).toFixed());
                    }).catch(function (err) {
                        console.log("error on cal distance" + err);
                    });
            }).catch(function (err) {
                console.log("error on geocoding" + err);
            });
        calCost();
        if (props != null) {
            props.changePhiVanChuyen(cost);
            props.tinhTien(cost);
        }
    }


    function calCost() {
        delivery.calCost(distance).then(function (res) {
            setCost(res.data);
        })
    }
    function handleKeypress(e) {
        if (e.keyCode === 13) {
            setCountPress(1);
            calDistance();
            if (city == "") {
                setCost(0);
                setCountPress(0);
            }
            if (countPress == 0) {
                myToast.toastLoading("đang tính phí vận chuyển", 6000);
            }
        }
    };

    return (
        <div className="Delivery">
            <input type="text" className="form-control border mb-2" onKeyDown={handleKeypress} onChange={(e) => setCity(e.target.value)} placeholder="nhập địa chỉ" />
            <div className="text-black py-2 text-info"><h6>Giao tới :</h6>{city}</div>
            <hr />
            <div className="text-black ">Phí vận chuyển : {cost === 0 && city !='' ?  "Miễn phí":cost + "đ" }</div>
        </div>
    );
}

export default Delivery;

