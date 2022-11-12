import Home from "../../Components/Home.js";
import NotFoundPage from "./NotFoundPage.js";
import Mobile from "../../Components/Mobile";
import Laptop from "../../Components/Laptop";
import Cart from "../../Components/Cart";
import Login from "../../Components/Accounts/Login.js";
import Register from "../../Components/Accounts/Register.js";
import Product from "../../Components/Product";
import Admin from "../../Components/Admin";
import Guarantee from "../../Components/Guarantee";
import ProductDashboard from "../../Components/Admin/ProductDashboard";
import CustomerDashboard from "../../Components/Admin/CustomerDashboard";
import BillingDashboard from "../../Components/Admin/BillingDashboard";
import StaffDashboard from "../../Components/Admin/StaffDashboard";
import StaffAccountDashboard from "../../Components/Admin/StaffAccountDashboard";
import SuplierDashboard from "../../Components/Admin/SuplierDashboard";
import ProductDetailDashboard from "../../Components/Admin/ProductDetailDashboard";
import PromotionDashboard from "../../Components/Admin/PromotionDashboard";
import CustomerAccountDashboard from "../../Components/Admin/CustomerAccountDashboard";
import ArticleDashboard from "../../Components/Admin/ArticleDashboard";
import GuaranteeDashboard from "../../Components/Admin/GuaranteeDashboard"
import TrademarkDashboard from "../../Components/Admin/TrademarkDashboard"
import MyAccountDashboard from "../../Components/Admin/MyAccountDashboard"
import Article from "../../Components/Article/index"
import ArticleDetail from "../../Components/Article/ArticleDetail"
import AddArticle from "../../Components/Article/addArticle"
import Promotion from "../../Components/Promotion";
import ForgotPassword from "../../Components/Accounts/ForgotPassword"
import LMember from "../../Components/Accounts/LMember.js";
import Privacy from "../../Components/Privacy"
import ThayDoiSDT from "../../Components/Accounts/ThongTinTaiKhoan/ThayDoiSDT";
import ThayDoiEmail from "../../Components/Accounts/ThongTinTaiKhoan/ThayDoiEmail";
import DeliveryCostDashboard from "../../Components/Admin/DeliveryCostDashboard/index.js";

const routes = [
  {
    path: "/",
    exact: true,
    main: () => <Home ></Home>,
  },
  {
    path: "/:loai/:hang/:dong/:sanpham",
    exact: true,
    main: ({ match }) => <Product match={match}></Product>,
  },
  {
    path: "/article",
    exact: true,
    main: () => <Article ></Article>,
  },
  {
    path: "/articledetail/:mabaiviet",
    exact: true,
    main: () => <ArticleDetail></ArticleDetail >
  },
  {
    path: "/addArticle",
    exact: false,
    main: () => <AddArticle></AddArticle>,
  },
  {
    path: "/mobile",
    exact: false,
    main: ({ match, location }) => <Mobile match={match} location={location}></Mobile>,
  },
  {
    path: "/laptop",
    exact: false,
    main: ({ match, location }) => <Laptop match={match} location={location}></Laptop>,
  },
  {
    path: "/cart",
    exact: false,
    main: () => <Cart></Cart>,
  },
  {
    path: "/promotion",
    exact: false,
    main: () => <Promotion></Promotion>,
  },
  {
    path: "/guarantee",
    exact: false,
    main: () => <Guarantee></Guarantee>
  },
  {
    path: "/privacy",
    exact: false,
    main: () => <Privacy></Privacy>
  },
  {
    path: "/login",
    exact: false,
    main: () => <Login></Login>,
  },
  {
    path: "/register",
    exact: false,
    main: ({ location }) => <Register location={location}></Register>,
  },
  {
    path: "/mobile/:productname/product",
    exact: false,
    main: ({ match }) => <Product match={match}></Product>,
  },
  {
    path: "/admin/overview",
    exact: true,
    main: () => <Admin></Admin>,
  },
  {
    path: "/admin/product",
    exact: true,
    main: () => <ProductDashboard></ProductDashboard>
  },
  {
    path: "/admin/article",
    exact: true,
    main: () => <ArticleDashboard></ArticleDashboard>
  },
  {
    path: "/admin/deliveryCost",
    exact: true,
    main: () => <DeliveryCostDashboard></DeliveryCostDashboard>
  },
  {
    path: "/admin/customer",
    exact: true,
    main: () => <CustomerDashboard></CustomerDashboard>,
  },
  {
    path: "/admin/staff",
    exact: true,
    main: () => <StaffDashboard></StaffDashboard>
  },
  {
    path: "/admin/billing",
    exact: true,
    main: () => <BillingDashboard></BillingDashboard>
  },
  {
    path: "/admin/suplier",
    exact: true,
    main: () => <SuplierDashboard></SuplierDashboard>
  },
  {
    path: "/admin/productdetail",
    exact: true,
    main: () => <ProductDetailDashboard></ProductDetailDashboard>
  },
  {
    path: "/admin/staffaccount",
    exact: true,
    main: () => <StaffAccountDashboard></StaffAccountDashboard>
  },
  {
    path: "/admin/promotion",
    exact: true,
    main: () => <PromotionDashboard></PromotionDashboard>
  },
  {
    path: "/admin/customeraccount",
    exact: true,
    main: () => <CustomerAccountDashboard></CustomerAccountDashboard>
  },
  {
    path: "/admin/guarantee",
    exact: true,
    main: () => <GuaranteeDashboard></GuaranteeDashboard>
  },
  {
    path: "/admin/trademark",
    exact: true,
    main: () => <TrademarkDashboard></TrademarkDashboard>
  },
  {
    path: "/admin/myaccount",
    exact: true,
    main: () => <MyAccountDashboard></MyAccountDashboard>
  },
  {
    path: "/lmember/thongtintaikhoan/sdt",
    exact: true,
    main: () => <ThayDoiSDT></ThayDoiSDT>
  },
  {
    path: "/lmember/thongtintaikhoan/email",
    exact: true,
    main: () => <ThayDoiEmail></ThayDoiEmail>
  },
  {
    path: "/lmember",
    exact: true,
    main: () => <LMember></LMember>
  },
  {
    path: "/forgotpassword",
    exact: true,
    main: () => <ForgotPassword></ForgotPassword>
  },
  {
    path: "",
    exact: false,
    main: () => <NotFoundPage></NotFoundPage>,
  },


];
export default routes;
