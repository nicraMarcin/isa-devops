import axios from 'axios';

console.log(process.env.REACT_APP_API_ENDPOINT);
const API_ENDPOINT_BASE = process.env.REACT_APP_API_ENDPOINT || "http://" + window.location.hostname + "/api";
console.log("API_ENDPOINT_BASE ",API_ENDPOINT_BASE)

export default axios.create({
    baseURL: API_ENDPOINT_BASE,
    responseType: "json"
});