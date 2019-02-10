<template lang="pug">
      <el-input placeholder="Please input" v-model="input"></el-input>
</template>
<script>
export default {
    name: 'app',
    data() {
      return {
        input: ''
      }
    }
}
</script>

<style lang="scss">
@import '../css/app.scss';

#main {
  width: 80%;
  margin: 0 auto;
}
</style>
