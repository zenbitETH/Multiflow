import React from "react";
//import { Contract } from "@ethersproject/contracts";
//import { getDefaultProvider } from "@ethersproject/providers";
import { useQuery } from "@apollo/react-hooks";

import logo from './assets/logo.png';
import useWeb3Modal from "./hooks/useWeb3Modal";

//import { addresses, abis } from "@project/contracts";
import GET_TRANSFERS from "./graphql/subgraph";
import Project from './components/Project';

//async function readOnChainData() {
//  // Should replace with the end-user wallet, e.g. Metamask
//  const defaultProvider = getDefaultProvider();
//  // Create an instance of an ethers.js Contract
//  // Read more about ethers.js on https://docs.ethers.io/v5/api/contract/contract/
//  const ceaErc20 = new Contract(addresses.ceaErc20, abis.erc20, defaultProvider);
//  // A pre-defined address that owns some CEAERC20 tokens
//  const tokenBalance = await ceaErc20.balanceOf("0x3f8CB69d9c0ED01923F11c829BaE4D9a4CB6c82C");
//  console.log({ tokenBalance: tokenBalance.toString() });
//}

function WalletButton({ provider, loadWeb3Modal, logoutOfWeb3Modal }) {
  return (
    <div className="wallet-button"
      onClick={() => {
        if (!provider) {
          loadWeb3Modal();
        } else {
          logoutOfWeb3Modal();
        }
      }}
    >
      {!provider ? "Connect Wallet" : "Disconnect Wallet"}
    </div>
  );
}

function App() {
  const { loading, error, data } = useQuery(GET_TRANSFERS);
  const [provider, loadWeb3Modal, logoutOfWeb3Modal] = useWeb3Modal();

  React.useEffect(() => {
    if (!loading && !error && data && data.transfers) {
      console.log({ transfers: data.transfers });
    }
  }, [loading, error, data]);

  return (
    <div className="App">
      <div className="header">
        <div className="logo">
          <img src={logo} alt="Multiflow" />
        </div>
        <div className="right">
          <WalletButton provider={provider} loadWeb3Modal={loadWeb3Modal} logoutOfWeb3Modal={logoutOfWeb3Modal} />
        </div>
      </div>
      <Project>
      </Project>
    
    </div>
  );
}

export default App;
