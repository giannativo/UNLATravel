<template>
<div class="text-center">
    <h4 class="mb-3">ABM Vuelos</h4>
    <div class="row">
        <div class="options text-center">
            <button type="button" class="btn btn-lg btn-block btn-primary">Altas</button>
            <button type="button" class="btn btn-lg btn-block btn-primary">Bajas</button>
            <button type="button" class="btn btn-lg btn-block btn-primary">Modificaciones</button>
        </div>             
    </div>
</div>
</template>

<script>
export default {
  name: 'ABMVuelo',
  props: {
    msg: String
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