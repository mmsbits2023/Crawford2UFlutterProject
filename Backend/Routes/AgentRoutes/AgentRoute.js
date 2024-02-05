const agentController = require('../../Controller/AgentClient');
const agentSchema = require('../../Schemas/AgentClientSchema');
const universalFunction = require('../../Functions/universalFunction');
const validationFunction = require("../../Functions/validationFunction");
const Router = require("express").Router();


//AgentRegister API
Router.route('/register').post(
   validationFunction.validateUser(agentSchema.generateRegisterSchema),
   agentController.registerAgent
);

//Login API
Router.route('/login').post(

    validationFunction.validateUser(agentSchema.verifyLoginSchema),
    agentController.loginAgent
);
//Logout API
Router.route('/logout').post(
    universalFunction.authenticateUser,
    validationFunction.validateUser(agentSchema.logoutAgentSchemas),
    agentController.agentLogout
);
 
//Get All Agent List
Router.route('/getAllAgentList').get(
   // universalFunction.authenticateUser,
        agentController.getAllAgentList
);
//Get One Agent Details
Router.route('/getOneAgentDetails/:agentId').get(
    universalFunction.authenticateUser,
    validationFunction.validateUser(agentSchema.getOneAgentSchemas),
    agentController.getOneAgentDetails
);

//Get  One Agent Details By Id
Router.route('/getOne').get(
    universalFunction.authenticateUser,
    validationFunction.validateUser(agentSchema.getOneAgentSchemas),
    agentController.getOneAgentDetailsById
);

//Update Agent Details
Router.route('/updateAgentDetails').post(
    universalFunction.authenticateUser,
    validationFunction.validateUser(agentSchema.updateAgentSchemas),
    agentController.updateAgentDetails
)
//Delete Agent Details
Router.route('/deleteAgentDetails').post(
    universalFunction.authenticateUser,
    validationFunction.validateUser(agentSchema.deleteAgentSchemas),
    agentController.deleteAgent
)
 //upload user profile image API
 Router.route('/upload').post(
    universalFunction.authenticateUser,
    validationFunction.validateUser,
     agentController.uplaodImageAgent
 );
 
exports.Router=Router;
















