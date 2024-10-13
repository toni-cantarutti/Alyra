import { ethers } from 'ethers'

/**
 * Deploy the given contract
 * @param {string} contractName name of the contract to deploy
 * @param {Array<any>} args list of constructor' parameters
 * @param {Number} accountIndex account index from the exposed account
 * @return {Contract} deployed contract
 */
export const deploy = async (contractJson: string, args: Array<any>, accountIndex?: number): Promise<ethers.Contract> => {

  console.log(`deploying ${contractJson}`)
  const metadata = JSON.parse(await remix.call('fileManager', 'getFile', contractJson))
  // 'web3Provider' is a remix global variable object

  const signer = (new ethers.providers.Web3Provider(web3Provider)).getSigner(accountIndex)

  const factory = new ethers.ContractFactory(metadata.abi, metadata.data.bytecode.object, signer)

  const contract = await factory.deploy(...args)

  // The contract is NOT deployed yet; we must wait until it is mined
  await contract.deployed()
  return contract
}