<template>
  <div class="center">
    <form @submit.prevent="submitForm">
        <div class="form-group">
            <label for="name">Nome:</label>
            <input type="text" class="form-control" id="name" v-model="name">
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" v-model="email">
        </div>
        <div class="form-group">
            <label for="phone">Telefone:</label>
            <input type="phone" class="form-control" id="phone" v-model="phone">
        </div>
        <div class="form-group">
            <label for="cpf">CPF:</label>
            <input type="text" class="form-control" id="cpf" v-model="cpf">
        </div>
        <div class="form-group">
            <label for="address">Endereço:</label>
            <input type="text" class="form-control" id="address" v-model="address">
        </div>
        <div class="form-group">
            <label for="message" >Mensagem:</label>
            <textarea class="form-control" id="message" v-model="message"></textarea>
        </div>
        <button class="btn btn-primary">Enviar</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';
import Swal from 'sweetalert2';
import { required, minLength, email } from 'vuelidate/lib/validators';

function validateCPF(cpf) {
  cpf = cpf.replace(/[^\d]+/g, '')

  if (cpf.length !== 11) {
    return false
  }

  if (/^(.)\1+$/.test(cpf)) {
    return false
  }

  let firstDigit = 0
  for (let i = 0; i < 9; i++) {
    firstDigit += parseInt(cpf.charAt(i)) * (10 - i)
  }
  firstDigit = (firstDigit * 10) % 11
  if (firstDigit === 10 || firstDigit === 11) {
    firstDigit = 0
  }
  if (firstDigit !== parseInt(cpf.charAt(9))) {
    return false
  }

  let secondDigit = 0
  for (let i = 0; i < 10; i++) {
    secondDigit += parseInt(cpf.charAt(i)) * (11 - i)
  }
  secondDigit = (secondDigit * 10) % 11
  if (secondDigit === 10 || secondDigit === 11) {
    secondDigit = 0
  }
  if (secondDigit !== parseInt(cpf.charAt(10))) {
    return false
  }

  return true
}


export default {
  data() {
    return {
      cpf: ''
    };
  },

  validations: {
    name: {
      required
    },
    cpf: {
      required,
      custom: value => validateCPF(value)
    },
    email: {
      required,
      email,
      minLength: minLength(5)
    },
    phone: {
      required,
    },
    address: {
      required
    },
    message: {
      required
    },
  },

  methods: {
    async submitForm() {
      try {
        const response = await axios.post('http://localhost:5000/api/contact', {
          name: this.name,
          email: this.email,
          phone: this.phone,
          cpf: this.cpf,
          address: this.address,
          message: this.message
        });

        console.log(response)

        Swal.fire({
          title: 'Contato Realizado com Sucesso!',
          text: 'Obrigado por entrar em contato conosco.',
  icon: 'success'
}).then(() => {
  this.name = '';
  this.email = '';
  this.phone = '';
  this.cpf = '';
  this.address = '';
  this.message = '';
});
      } catch (error) {
        console.error(error);
      }
    }
  }
};
</script>

<style scoped>
.center {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    max-width: 800px;
    width: 100%;
    padding: 20px;
    
}
input, textarea {
  border: 1px solid #ddd;
  border-radius: 5px;
  padding: 10px;
  box-sizing: border-box;
}

form {
  box-shadow: 0px 0px 10px rgba(0,0,0,0.3);
  margin: 20px;
}
.form-group {
    padding: 20px;
}
button {
    padding: 20px;
    width: 200px;
    margin: 20px;
}
button:hover {
  background-color: #00bfff;
}
@import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');

body, input, textarea, button {
  font-family: 'Open Sans', sans-serif;
}

.form-group label {
    display: block;
    text-align: left;
  }
  @media (max-width: 480px) {
    .center {
    top: 80%
    }
    button {
    width: 72%;
  }
    }
  @media (min-width: 576px) {
      .form-group {
      display: inline-block;
      width: calc(50% - 20px);
      margin-right: 20px;
      vertical-align: top;
    }
  }

  @media only screen and (max-width: 768px) {
  .center {
    width: 90%;
    padding: 10px;
    }
  input, textarea {
    font-size: 14px;
  }
  label {
    font-size: 16px;
  }
  button {
    font-size: 16px;
    width: 90%;
  }
}


</style>
