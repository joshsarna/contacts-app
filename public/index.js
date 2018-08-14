/* global Vue, VueRouter, axios */

var EditPage = {
  template: "#edit-page",
  data: function() {
    return {
      firstName: "",
      middleName: "",
      lastName: "",
      email: "",
      phoneNumber: "",
      bio: "",
      errors: []
    };
  },
  created: function() {
    axios.get("/api/contacts").then(function(response) {
      
    }.bind(this));
  },
  methods: {
    addContact: function() {
      var params = {
        first_name: this.firstName,
        middle_name: this.middleName,
        last_name: this.lastName,
        email: this.email,
        phone_number: this.phoneNumber,
        bio: this.bio
      };
      axios
        .patch("/api/contacts", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var NewPage = {
  template: "#new-page",
  data: function() {
    return {
      firstName: "",
      middleName: "",
      lastName: "",
      email: "",
      phoneNumber: "",
      bio: "",
      errors: []
    };
  },
  methods: {
    addContact: function() {
      var params = {
        first_name: this.firstName,
        middle_name: this.middleName,
        last_name: this.lastName,
        email: this.email,
        phone_number: this.phoneNumber,
        bio: this.bio
      };
      axios
        .post("/api/contacts", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      axios
        .post("/api/sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/api/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Don't forget to call your mom every once in a while!",
      contacts: [],
      selectedContact: {
        firstName: "first name",
        middleName: "middle name",
        lastName: "last name",
        email: "email",
        phoneNumber: "phone number",
        bio: "bio"
      }
    };
  },
  created: function() {
    axios.get("/api/contacts").then(function(response) {
      this.contacts = response.data;
    }.bind(this));
  },
  methods: {
    changeSelectedContact: function(clickedContact) {
      this.selectedContact = clickedContact;
      console.log("click successful");
    },
    loadEditPage: function() {
      console.log("load edit page");
      router.push("/contacts/' + selectedContact.id + '/edit'");
    }
  },
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/contacts", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/contacts/new", component: NewPage },
    { path: "/contacts/:id/edit", component: EditPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
