import { deploy } from './ethers-lib'
;(async () => {
    try {
        const solFile = await remix.call('fileManager', 'getCurrentFile')
        const buildFile = "browser/"+solFile.replace(/\.sol$/, '.json').replace(/\/([^/]+)\.json$/, '/artifacts/$1.json')
        const result = await deploy(
            buildFile,
            [],
        )
        console.log(`address: ${result.address}`)
    } catch (e) {
        console.log(e.message)
    }
})()
