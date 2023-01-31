<template>
  <div class="center">
    <form>
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
