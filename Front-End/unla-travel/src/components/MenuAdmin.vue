<template>
<div class="container bg-light">
    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">  
    </div>
    <div class="text-center">
        <div class="row">
            <div class="options text-center">                
                <button type="button" class="btn btn-lg btn-block btn-primary">ABM Vuelos</button>
                <button type="button" class="btn btn-lg btn-block btn-primary">ABM Alojamientos</button>
                <button type="button" class="btn btn-lg btn-block btn-primary">ABM Actividades</button>
                <button type="button" class="btn btn-lg btn-block btn-primary">ABM Paquetes</button>
                <button type="button" class="btn btn-lg btn-block btn-primary">ABM Administradores</button>
            </div>
        </div>
    </div>
</div>
</template>

<script>
export default {
  name: 'MenuAdmin',
  props: {
    msg: String,
    info: null
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.container {
    max-width: 960px;
}
.options {
    margin: auto;
}
.border-top { 
    border-top: 1px solid #e5e5e5; 
}
.border-bottom { 
    border-bottom: 1px solid #e5e5e5; 
}
.border-top-gray { 
    border-top-color: #adb5bd; 
}
.box-shadow { 
    box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .05); 
}
.lh-condensed { 
    line-height: 1.25; 
}
</style>