var router = require("express").Router();
var util = require("util");
var users = new (require("./controller/users"))();
var home = new (require("./controller/home"))();

router.get("/", home.get);
router.get("/users", users.generic);
router.get("/user", users.getUser);
router.post("/register", users.postRegisterUser);
router.post("/user/:EMAIL", users.postForUserInfo);
router.post("/users/reset", users.reset);

module.exports = router;
