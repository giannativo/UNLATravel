<template>
  <div id="app">
    <div>
    <img alt="Vue logo" src="./assets/logo.png">
        {{ info }}
    </div>
    <MenuAdmin msg="Welcome to Your Vue.js App"/>
  </div>
</template>

<script>
import MenuAdmin from './components/MenuAdmin.vue'

export default {
  name: 'App',
  components: {
    MenuAdmin
  },
  props: {
    info: null
  },
  mounted () {
    this.$axios
      .get('https://localhost:57935/api/user')
      .then(response => (this.info = response))
  }

}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
