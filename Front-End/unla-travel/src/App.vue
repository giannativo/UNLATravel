<template>
  <div id="app">
    <div>
        {{ info }}
    </div>
    <MenuAdmin msg="Welcome to Your Vue.js App"/>
  </div>
</template>

<script>
import MenuAdmin from './components/MenuAdmin.vue'
import '@fortawesome/fontawesome-free/css/all.css'
import '@fortawesome/fontawesome-free/js/all.js'

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
