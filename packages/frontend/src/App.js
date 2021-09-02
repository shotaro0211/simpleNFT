import './App.css';
import { ethers } from "ethers";
import React from 'react';
import ReactDOM from 'react-dom';
import {abi,bytecode} from "../../contracts/artifacts/contracts/NFT.sol/NFT.json";

window.ethereum.enable();
const provider = new ethers.providers.Web3Provider(window.ethereum);
let address = "0x604d6ea0f769e0d48349107a961dae47c8466d43" 
let total_supply = 0
function getParam(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}
const pass = getParam('password');
let password = ['リンゴ', 'バナナ', 'パイナップル', 'グレープ'];
const buttonDeploy = async() => {
  const signer = provider.getSigner();
  const factory = new ethers.ContractFactory(abi,bytecode,signer);
  const contract = await factory.deploy();
  address = contract.address;
  const net = await signer.provider.getNetwork();
  if( net.chainId === 4) console.log("https://rinkeby.etherscan.io/tx/" + contract.deployTransaction.hash);
};
const buttonGetName = async() => {
  const contract = new ethers.Contract(address, abi, provider);
  console.log(await contract.name())
  console.log(address);
};
const buttonMint = async() => {
  const contract = new ethers.Contract(address, abi, provider);
  console.log(address);
  const supply = await contract.totalSupply()
  total_supply = supply._hex.slice(3);
  console.log(total_supply);
  if (total_supply <= 7) { 
    const signer = provider.getSigner();
    const contract = new ethers.Contract(address, abi, provider);
    const {hash } = await contract.connect(signer).mint(signer.getAddress());
    console.log(contract);
    console.log(address);
    const net = await signer.provider.getNetwork();
    if( net.chainId === 4) console.log("https://rinkeby.etherscan.io/tx/" + hash);
  } else {
  };
};
const customStyles = {
  content: {
    top: '50%',
    left: '50%',
    right: 'auto',
    bottom: 'auto',
    marginRight: '-50%',
    transform: 'translate(-50%, -50%)',
  },
};

function App() {
  return (
    <div className="App">
      <div className="Top">
        <div className="Title">丹沢山頂到着!!!</div>
        <div className="Description">山頂の景色を画像で送信し、NFTを獲得せよ</div>
        <div className="ButtonContainer">
          <button className="Button" id="test2" onClick={buttonMint}>獲得する</button>
        </div>
      </div>
    </div>
  );
}

export default App;
