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

export default {
  data() {
    return {
      // Dados do formulário
    };
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

        // Exibir mensagem pop-up após o envio bem-sucedido
        Swal.fire({
          title: 'Contato Realizado com Sucesso!',
          text: 'Obrigado por entrar em contato conosco.',
  icon: 'success'
}).then(() => {
  // Limpar os dados do formulário
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
    max-width: 500px;
    width: 80%;
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


</style>
