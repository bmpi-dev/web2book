<template lang="pug">
<el-container style="height: 500px; border: 1px solid #eee">
<el-header style="text-align: right; font-size: 12px">
</el-header>
<el-main>
<el-row :gutter="20" class="center">
<el-col :span="4">
<div class="grid-content bg-white"></div>
</el-col>
<el-col :span="8">
<el-input placeholder="input url" v-model="url"></el-input>
</el-col>
<el-col :span="5">
<el-input placeholder="input email" v-model="email"></el-input>
</el-col>
<el-col :span="5">
<el-button type="primary" plain v-on:click="go">GO!</el-button>
</el-col>
  </el-row>
    </el-main>
    <el-footer>
    </el-footer>
</el-container>
</template>

<script>
export default {
    name: 'app',
    data() {
        return {
            url: '',
            email: ''
        }
    },
    methods: {
        go: function (event) {
            console.log("url is" + this.url);
            console.log("email is" + this.email);
            const body = {
                "url": this.url,
                "email": this.email
            };
            const h = this.$createElement;
            this.$http.post('http://localhost:4000/api/inbox', body, {emulateJSON: true})
                .then(response => {
                    console.log(response.body);
                    this.$notify({
                        title: 'download path',
                        message: h('i', { style: 'color: teal'}, response.body["path"])
                     });
                }, response => {
                    console.error(response.body);
                });
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

.el-header {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
}
.el-footer {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
}
.center {
    margin: 0;
    position: absolute;
    top: 50%;
    left: 50%;
    -ms-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
}
.el-row {
    margin-bottom: 20px;
    &:last-child {
        margin-bottom: 0;
    }
}
.el-col {
    border-radius: 4px;
}
.bg-purple-dark {
    background: #99a9bf;
}
.bg-purple {
    background: #d3dce6;
}
.bg-white {
    background: #FFFFFF;
}
.bg-purple-light {
    background: #e5e9f2;
}
.grid-content {
    border-radius: 4px;
    min-height: 36px;
}
.row-bg {
    padding: 10px 0;
    background-color: #f9fafc;
}
</style>
