const mongoose = require("mongoose");

/*mongoose.connect("mongodb://127.0.0.1:27017/AgentDetails")
    .then(() => { 
        console.log("Connection is successfully..");
    })
    .catch(() => { 
        console.log("No Connection here..")
    })*/
const DB= 'mongodb+srv://mmsbits2023:mms@2023@crawford2u.jkbnrxq.mongodb.net/Crawford2U?retryWrites=true&w=majority';
//mongodb+srv://mmsbits2023:mms@2023@ecommcluster.3xatjua.mongodb.net/EcommCluster?retryWrites=true&w=majority
mongoose.connect(DB, {
    useNewUrlParser: true,
    useCreateIndex: true,
    useUnifiedTopology: true,
    useFindAndModify:false
})
    .then(() => { 
        console.log("Connection is successfully..");
    })
    .catch(() => { 
        console.log("No Connection here..")
    })