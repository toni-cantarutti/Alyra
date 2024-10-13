import { deploy } from './custom_ethers-lib'
;(async () => {
    try {
        const solFile = await remix.call('fileManager', 'getCurrentFile')
        const buildFile = "browser/"+solFile.replace(/\.sol$/, '.json').replace(/\/([^/]+)\.json$/, '/artifacts/$1.json')

        console.log(solFile+" -> "+buildFile);
        const result = await deploy(
            buildFile,
            [],
        )
        console.log(`address: ${result.address}`)
    } catch (e) {
        console.log(e.message)
    }
})()
