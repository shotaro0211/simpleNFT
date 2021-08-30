import './App.css';
import Header from './Header'
//ethereumのライブラリー
import { ethers } from "ethers";
import React from 'react';
import ReactDOM from 'react-dom';
import Modal from 'react-modal';
//NFT.solのdeployファイルをとりこむ。cracoを使ってModuleScopePluginの設定を削除しないとimportできない。
import {abi,bytecode} from "../../contracts/artifacts/contracts/NFT.sol/NFT.json";

//Providerを作成。Ethereumへのネットワーク接続を管理します。
const provider = new ethers.providers.Web3Provider(window.ethereum);
let address = "0x604d6ea0f769e0d48349107a961dae47c8466d43" //NFTのdeploy時のアドレスを指定する。
//Clickの処理.NFTをDeploy
const buttonDeploy = async() => {
  //署名を取得します。コントラクトの作成には署名が必要です。基本的に、コントラクトの生成や値が変わる処理にはマイニングが必要なので署名が必要です。
  const signer = provider.getSigner();
  //abi,bytecode,署名からコントラクトを作成するためのfactoryを作ります。
  const factory = new ethers.ContractFactory(abi,bytecode,signer);
  //NFTをdeployします。
  const contract = await factory.deploy();//metamaskの署名を要求する
  address = contract.address;//deployしたアドレス。
  console.log(contract);
  console.log(address);
  //rinkebyのchainidのときはetherscanのリンクを表示
  const net = await signer.provider.getNetwork();
  if( net.chainId === 4) console.log("https://rinkeby.etherscan.io/tx/" + contract.deployTransaction.hash);//Tx Hash Etherscanで探す。
};
//Clickの処理.consoleにnameが表示されればOK.Txがcommitされる前に押すとエラーになる。
const buttonGetName = async() => {
  const contract = new ethers.Contract(address, abi, provider);
  console.log(await contract.name())
  console.log(address);
};
//Clickの処理.NFTをmint
const buttonMint = async() => {
  const signer = provider.getSigner();
  //以前にdeployしたコントラクトのアドレスからコントラクトを特定します。
  const contract = new ethers.Contract(address, abi, provider);
  //署名を付けてコントラクトのmintを実行します。
  const {hash } = await contract.connect(signer).mint(signer.getAddress());//metamaskの署名を要求する
  console.log(contract);
  console.log(address);
  //rinkebyのchainidのときはetherscanのリンクを表示
  const net = await signer.provider.getNetwork();
  if( net.chainId === 4) console.log("https://rinkeby.etherscan.io/tx/" + hash);//Tx Hash Etherscanで探す。
};
//Clickの処理.NFTのtotalSupply
const buttonSupply = async() => {
  const contract = new ethers.Contract(address, abi, provider);
  console.log(address);
  console.log(await contract.totalSupply());
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

// Make sure to bind modal to your appElement (https://reactcommunity.org/react-modal/accessibility/)
Modal.setAppElement('#root');
function App() {
  let subtitle;
  const [modalIsOpen, setIsOpen] = React.useState(false);

  function openModal() {
    setIsOpen(true);
  }

  function afterOpenModal() {
    // references are now sync'd and can be accessed.
    subtitle.style.color = '#f00';
  }

  function closeModal() {
    setIsOpen(false);
  }
  return (
    <div className="App">
      <Header />
      <div className="Top">
        <div className="Title">クリオネ募金<span className="TitleMoney">寄付総額: 7123197円</span></div>
        <div className="DescriptionContainer">
          <div className="Description">
            あなたの寄付が報われる世界へ<br /><br />
            あなたの思いを本当に困っている人へ送り届けます
          </div>
        </div>
        <div className="ButtonContainer">
          <button className="Button" onClick={() => setIsOpen(true)}>寄付する</button>
        </div>
        <Modal className="Modal" isOpen={modalIsOpen}>
          <div className="Select">
            <div>福島県沖の地震<span className="SelectContainer"><button className="SelectButton" id="test" onClick={buttonDeploy}>寄付する</button></span><br/><br/></div>
            <div>松江市火災<span className="SelectContainer"><button className="SelectButton" id="test" onClick={buttonDeploy}>寄付する</button></span><br/><br/></div>
            <div>山形県沖の地震<span className="SelectContainer"><button className="SelectButton" id="test" onClick={buttonDeploy}>寄付する</button></span><br/><br/></div>
            <div>島根県吉賀町火災<span className="SelectContainer"><button className="SelectButton" id="test" onClick={buttonDeploy}>寄付する</button></span><br/><br/></div>
            <div>島根県吉賀町火災<span className="SelectContainer"><button className="SelectButton" id="test2" onClick={buttonMint}>寄付する</button></span><br/><br/></div>
          </div>
        </Modal>
      </div>
    </div>
  );
}
export default App;
