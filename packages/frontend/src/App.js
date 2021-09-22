import './App.css';
import { ethers } from "ethers";
import React from 'react';
import ReactDOM from 'react-dom';
import {abi,bytecode} from "../../contracts/artifacts/contracts/HM.sol/HM.json";

window.ethereum.enable();
const provider = new ethers.providers.Web3Provider(window.ethereum);
let address = "0xeb9f48952389b4e0b3523ad1c9137b05b65722bf" 
// let address = "0xe26cda4a1b976f13e6683e04a7a5067d084d4a90" 
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
  if (total_supply <= 100) { 
    const signer = provider.getSigner();
    const contract = new ethers.Contract(address, abi, provider);
    const {hash } = await contract.connect(signer).claim();
    console.log(contract);
    console.log(address);
    const net = await signer.provider.getNetwork();
    if( net.chainId === 4) console.log("https://rinkeby.etherscan.io/tx/" + hash);
  } else {
    const signer = provider.getSigner();
    const contract = new ethers.Contract(address, abi, provider);
    const {hash } = await contract.connect(signer).mint(signer.getAddress());
    console.log(contract);
    console.log(address);
    const net = await signer.provider.getNetwork();
    if( net.chainId === 4) console.log("https://rinkeby.etherscan.io/tx/" + hash);
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
        <div className="Title">東南アジア日本人サッカー選手応援NFTガチャ</div>
        <div className="Description">こちらのガチャは、ハーフチェーンジェネラティブNFTとなっています</div>
        <div className="ButtonContainer">
          <button className="Button" id="test2" onClick={buttonMint}>獲得する</button>
        </div>
      </div>
    </div>
  );
}

export default App;
