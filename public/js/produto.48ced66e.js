(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["produto"],{"449a":function(e,a,r){"use strict";var t=r("1da1"),o=r("d4ec"),i=r("bee2"),s=r("262e"),c=r("2caf"),n=(r("96cf"),r("99af"),r("0dcc")),l=function(e){Object(s["a"])(r,e);var a=Object(c["a"])(r);function r(){return Object(o["a"])(this,r),a.apply(this,arguments)}return Object(i["a"])(r,[{key:"model",value:function(){return"categoria"}},{key:"read",value:function(){var e=Object(t["a"])(regeneratorRuntime.mark((function e(a){return regeneratorRuntime.wrap((function(e){while(1)switch(e.prev=e.next){case 0:return e.abrupt("return",this.client.get("".concat(this.model(),"/").concat(a)));case 1:case"end":return e.stop()}}),e,this)})));function a(a){return e.apply(this,arguments)}return a}()},{key:"update",value:function(){var e=Object(t["a"])(regeneratorRuntime.mark((function e(a,r){return regeneratorRuntime.wrap((function(e){while(1)switch(e.prev=e.next){case 0:return e.abrupt("return",this.client.put("".concat(this.model(),"/").concat(a),r));case 1:case"end":return e.stop()}}),e,this)})));function a(a,r){return e.apply(this,arguments)}return a}()}]),r}(n["a"]);a["a"]=l},e9c2:function(e,a,r){"use strict";r.r(a);var t=function(){var e=this,a=e.$createElement,r=e._self._c||a;return r("v-container",{staticClass:"elements-page mt-3",attrs:{fluid:""}},[r("v-navigation-drawer",{attrs:{absolute:"",right:"",temporary:""},model:{value:e.drawer,callback:function(a){e.drawer=a},expression:"drawer"}},[r("v-card",{staticClass:"elevation-0"},[r("v-card-text",[r("v-list",{attrs:{nav:"",dense:""}},[r("v-list-item",{attrs:{link:""}},[r("v-list-item-icon",[r("v-icon",[e._v("mdi-filter-plus-outline")])],1),r("v-list-item-title",[e._v("Pesquisar")])],1)],1),r("v-form",[r("v-row",[r("v-col",{attrs:{cols:"12",md:"12"}},[r("v-checkbox",{attrs:{label:"Ativo"},model:{value:e.formPesquisa.ativo,callback:function(a){e.$set(e.formPesquisa,"ativo",a)},expression:"formPesquisa.ativo"}}),r("v-text-field",{attrs:{clearable:"",label:"Código"},model:{value:e.formPesquisa.codigo,callback:function(a){e.$set(e.formPesquisa,"codigo",a)},expression:"formPesquisa.codigo"}}),r("v-text-field",{attrs:{clearable:"",label:"Nome"},model:{value:e.formPesquisa.nome,callback:function(a){e.$set(e.formPesquisa,"nome",a)},expression:"formPesquisa.nome"}}),r("v-text-field",{attrs:{clearable:"",label:"Descricao"},model:{value:e.formPesquisa.descricao,callback:function(a){e.$set(e.formPesquisa,"descricao",a)},expression:"formPesquisa.descricao"}}),r("v-combobox",{key:e.formPesquisa.marca,attrs:{items:e.marcas,"item-text":"nome","item-value":"id",clearable:"",label:"Marca"},model:{value:e.formPesquisa.marca,callback:function(a){e.$set(e.formPesquisa,"marca",a)},expression:"formPesquisa.marca"}}),r("v-combobox",{attrs:{items:e.categorias,"item-text":"nome","item-value":"id",clearable:"",label:"Categoria"},model:{value:e.formPesquisa.categoria,callback:function(a){e.$set(e.formPesquisa,"categoria",a)},expression:"formPesquisa.categoria"}})],1)],1)],1)],1),r("v-card-actions",{staticClass:"justify-around"},[r("v-btn",{attrs:{color:"primary"},on:{click:function(a){return e.pesquisar()}}},[e._v("Pesquisar")])],1)],1)],1),r("v-card",[r("v-card-title",[e._v(" Produto "),r("v-spacer"),r("v-btn",{attrs:{color:"blue darken-2",icon:"",dark:""},on:{click:function(a){e.drawer=!e.drawer}}},[r("v-icon",[e._v("mdi-filter-outline")])],1)],1),r("v-card-text",[r("v-btn",{attrs:{fab:"",absolute:"",left:"",bottom:"",color:"primary",primary:""},on:{click:function(a){return a.stopPropagation(),e.openDialog()}}},[r("v-icon",[e._v("mdi-plus")])],1),r("v-data-table",{staticClass:"elevation-0",attrs:{options:e.options,"server-items-length":e.totalItems,loading:e.loading,"items-per-page":15,height:"700",headers:e.headers,items:e.items},on:{"update:options":function(a){e.options=a}},scopedSlots:e._u([{key:"item.ativo",fn:function(a){var r=a.item;return[e._v(" "+e._s(1==r.ativo?"Sim":"Não")+" ")]}},{key:"item.marca",fn:function(a){var r=a.item;return[e._v(" "+e._s(r.marca.nome)+" ")]}},{key:"item.categoria",fn:function(a){var r=a.item;return[e._v(" "+e._s(r.categoria.nome)+" ")]}},{key:"item.id",fn:function(a){var t=a.item;return[r("v-btn",{attrs:{icon:""},on:{click:function(a){return a.stopPropagation(),e.openDialogEdit(t)}}},[r("v-icon",{attrs:{color:"yellow darken-2"}},[e._v("mdi-pencil")])],1)]}}])})],1)],1),r("v-dialog",{ref:"dialog-insert",attrs:{transition:"dialog-top-transition","max-width":"1000"},scopedSlots:e._u([{key:"default",fn:function(a){return[r("v-card",[r("v-toolbar",{attrs:{color:"primary",dark:""}},[e._v("Adicionando novo Produto")]),r("v-card-text",[r("v-form",[r("v-row",[r("v-col",{attrs:{cols:"12",md:"12"}},[r("v-checkbox",{attrs:{label:"Ativo",error:e.errors.ativo.length>0,"error-messages":e.errors.ativo},model:{value:e.form.ativo,callback:function(a){e.$set(e.form,"ativo",a)},expression:"form.ativo"}})],1)],1),r("v-row",[r("v-col",{attrs:{cols:"12",md:"4"}},[r("v-text-field",{ref:"form_codigo",attrs:{label:"Codigo",error:e.errors.codigo.length>0,"error-messages":e.errors.codigo},model:{value:e.form.codigo,callback:function(a){e.$set(e.form,"codigo",a)},expression:"form.codigo"}})],1),r("v-col",{attrs:{cols:"12",md:"8"}},[r("v-text-field",{attrs:{label:"Nome",error:e.errors.nome.length>0,"error-messages":e.errors.nome},model:{value:e.form.nome,callback:function(a){e.$set(e.form,"nome",a)},expression:"form.nome"}})],1)],1),r("v-row",[r("v-col",{attrs:{cols:"12",md:"12"}},[r("v-textarea",{attrs:{value:e.form.descricao,rows:"5",label:"Descrição",counter:"",error:e.errors.descricao.length>0,"error-messages":e.errors.descricao},model:{value:e.form.descricao,callback:function(a){e.$set(e.form,"descricao",a)},expression:"form.descricao"}})],1)],1),r("v-row",[r("v-col",{attrs:{cols:"12",md:"4"}},[r("v-combobox",{attrs:{items:e.marcas,"item-text":"nome","item-value":"id",label:"Marca",error:e.errors.nome.length>0,"error-messages":e.errors.nome},model:{value:e.form.marca,callback:function(a){e.$set(e.form,"marca",a)},expression:"form.marca"}})],1),r("v-col",{attrs:{cols:"12",md:"4"}},[r("v-combobox",{attrs:{items:e.categorias,"item-text":"nome","item-value":"id",label:"Categoria",error:e.errors.categoria_id.length>0,"error-messages":e.errors.categoria_id},model:{value:e.form.categoria,callback:function(a){e.$set(e.form,"categoria",a)},expression:"form.categoria"}})],1),r("v-col",{attrs:{cols:"12",md:"4"}},[r("v-text-field",{attrs:{label:"Quantidade",error:e.errors.quantidade.length>0,"error-messages":e.errors.quantidade},model:{value:e.form.quantidade,callback:function(a){e.$set(e.form,"quantidade",a)},expression:"form.quantidade"}})],1)],1),r("v-row",[r("v-col",{attrs:{cols:"12",md:"4"}},[r("v-text-field",{directives:[{name:"money",rawName:"v-money",value:e.money,expression:"money"}],attrs:{label:"Custo",error:e.errors.custo.length>0,"error-messages":e.errors.custo},model:{value:e.form.custo,callback:function(a){e.$set(e.form,"custo",a)},expression:"form.custo"}})],1),r("v-col",{attrs:{cols:"12",md:"4"}},[r("v-text-field",{directives:[{name:"money",rawName:"v-money",value:e.money,expression:"money"}],attrs:{label:"Preço",error:e.errors.preco.length>0,"error-messages":e.errors.preco},model:{value:e.form.preco,callback:function(a){e.$set(e.form,"preco",a)},expression:"form.preco"}})],1),r("v-col",{attrs:{cols:"12",md:"4"}},[r("v-text-field",{attrs:{label:"Quantidade Alerta",error:e.errors.alerta.length>0,"error-messages":e.errors.alerta},model:{value:e.form.quantidade_alerta,callback:function(a){e.$set(e.form,"quantidade_alerta",a)},expression:"form.quantidade_alerta"}})],1)],1)],1)],1),r("v-card-actions",{staticClass:"justify-around"},[r("v-btn",{attrs:{color:"primary"},on:{click:function(a){return e.cadastrar()}}},[e._v("Salvar")]),r("v-spacer"),r("v-btn",{attrs:{text:""},on:{click:function(e){!1}}},[e._v("Fechar")])],1)],1)]}}]),model:{value:e.dialog,callback:function(a){e.dialog=a},expression:"dialog"}}),r("v-dialog",{ref:"dialog-edit",attrs:{transition:"dialog-top-transition","max-width":"1000"},model:{value:e.dialogEdit,callback:function(a){e.dialogEdit=a},expression:"dialogEdit"}},[r("v-card",[r("v-toolbar",{attrs:{color:"primary",dark:""}},[e._v("Editando Produto")]),r("v-card-text",[r("v-form",[r("v-row",[r("v-col",{attrs:{cols:"12",md:"12"}},[r("v-checkbox",{attrs:{label:"Ativo",error:e.errors.ativo.length>0,"error-messages":e.errors.ativo},model:{value:e.formEdit.ativo,callback:function(a){e.$set(e.formEdit,"ativo",a)},expression:"formEdit.ativo"}})],1)],1),r("v-row",[r("v-col",{attrs:{cols:"12",md:"4"}},[r("v-text-field",{attrs:{label:"Codigo",error:e.errors.codigo.length>0,"error-messages":e.errors.codigo},model:{value:e.formEdit.codigo,callback:function(a){e.$set(e.formEdit,"codigo",a)},expression:"formEdit.codigo"}})],1),r("v-col",{attrs:{cols:"12",md:"8"}},[r("v-text-field",{attrs:{label:"Nome",error:e.errors.nome.length>0,"error-messages":e.errors.nome},model:{value:e.formEdit.nome,callback:function(a){e.$set(e.formEdit,"nome",a)},expression:"formEdit.nome"}})],1)],1),r("v-row",[r("v-col",{attrs:{cols:"12",md:"12"}},[r("v-textarea",{attrs:{rows:"5",value:e.formEdit.descricao,label:"Descrição",counter:"",error:e.errors.descricao.length>0,"error-messages":e.errors.descricao},model:{value:e.formEdit.descricao,callback:function(a){e.$set(e.formEdit,"descricao",a)},expression:"formEdit.descricao"}})],1)],1),r("v-row",[r("v-col",{attrs:{cols:"12",md:"4"}},[r("v-combobox",{attrs:{items:e.marcas,"item-text":"nome","item-value":"id",label:"Marca",error:e.errors.marca_id.length>0,"error-messages":e.errors.marca_id},model:{value:e.formEdit.marca,callback:function(a){e.$set(e.formEdit,"marca",a)},expression:"formEdit.marca"}})],1),r("v-col",{attrs:{cols:"12",md:"4"}},[r("v-combobox",{attrs:{items:e.categorias,"item-text":"nome","item-value":"id",label:"Categoria",error:e.errors.categoria_id.length>0,"error-messages":e.errors.categoria_id},model:{value:e.formEdit.categoria,callback:function(a){e.$set(e.formEdit,"categoria",a)},expression:"formEdit.categoria"}})],1),r("v-col",{attrs:{cols:"12",md:"4"}},[r("v-text-field",{attrs:{label:"Quantidade",error:e.errors.quantidade.length>0,"error-messages":e.errors.quantidade},model:{value:e.formEdit.quantidade,callback:function(a){e.$set(e.formEdit,"quantidade",a)},expression:"formEdit.quantidade"}})],1)],1),r("v-row",[r("v-col",{attrs:{cols:"12",md:"4"}},[r("v-text-field",{directives:[{name:"money",rawName:"v-money",value:e.money,expression:"money"}],attrs:{label:"Custo",error:e.errors.custo.length>0,"error-messages":e.errors.custo},model:{value:e.formEdit.custo,callback:function(a){e.$set(e.formEdit,"custo",a)},expression:"formEdit.custo"}})],1),r("v-col",{attrs:{cols:"12",md:"4"}},[r("v-text-field",{directives:[{name:"money",rawName:"v-money",value:e.money,expression:"money"}],attrs:{label:"Preço",error:e.errors.preco.length>0,"error-messages":e.errors.preco},model:{value:e.formEdit.preco,callback:function(a){e.$set(e.formEdit,"preco",a)},expression:"formEdit.preco"}})],1),r("v-col",{attrs:{cols:"12",md:"4"}},[r("v-text-field",{attrs:{label:"Quantidade Alerta",error:e.errors.alerta.length>0,"error-messages":e.errors.alerta},model:{value:e.formEdit.quantidade_alerta,callback:function(a){e.$set(e.formEdit,"quantidade_alerta",a)},expression:"formEdit.quantidade_alerta"}})],1)],1)],1)],1),r("v-card-actions",{staticClass:"justify-around"},[r("v-btn",{attrs:{color:"primary"},on:{click:function(a){return e.atualizar()}}},[e._v("Salvar")]),r("v-spacer"),r("v-btn",{attrs:{text:""},on:{click:function(a){e.dialogEdit=!1}}},[e._v("Fechar")])],1)],1)],1)],1)},o=[],i=(r("b680"),r("7c97")),s=r("40a4"),c=r("449a"),n=r("c28b"),l=r("716b"),d=r("9744"),m=r("b444"),u={mixins:[d["a"]],name:"Produto",data:function(){return{money:{decimal:",",thousands:".",prefix:"",precision:2,masked:!1},drawer:!1,loading:!1,dialog:!1,dialogEdit:!1,options:{},totalItems:0,formPesquisa:{ativo:!0,nome:"",codigo:"",descricao:"",marca:"",categoria:""},items:[],form:{ativo:"",nome:"",codigo:"",descricao:"",marca_id:"",categoria_id:"",marca:{},categoria:{},custo:"",preco:"",quantidade:"",quantidade_alerta:""},errors:{ativo:[],nome:[],codigo:[],descricao:[],marca_id:[],categoria_id:[],custo:[],preco:[],quantidade:[],alerta:[]},formEdit:{ativo:"",nome:"",codigo:"",descricao:"",marca_id:"",categoria_id:"",marca:"",categoria:"",custo:"",preco:"",quantidade:"",quantidade_alerta:""},marcas:[],categorias:[],menu_from:!1,menu_to:!1,modal:!1,headers:[{text:"",value:"id",sortable:!0},{text:"Nome",value:"nome",align:"left",sortable:!0},{text:"Código",value:"codigo",align:"left",sortable:!0},{text:"Descrição",value:"descricao",align:"left",sortable:!0},{text:"Marca",value:"marca",align:"left",sortable:!0},{text:"Categoria",value:"categoria",align:"left",sortable:!0},{text:"Custo",value:"custo",align:"left",sortable:!0},{text:"Preço",value:"preco",align:"left",sortable:!0},{text:"Quantidade",value:"quantidade",align:"left",sortable:!0},{text:"Alerta",value:"quantidade_alerta",align:"left",sortable:!0},{text:"Ativo",value:"ativo",align:"left",sortable:!0}]}},created:function(){this.listarCategoria(),this.listarMarca()},watch:{options:function(){this.pesquisar()}},methods:{pesquisar:function(){var e=this;this.loading=!0;var a=new s["a"],r={nome:this.formPesquisa.nome,codigo:this.formPesquisa.codigo,descricao:this.formPesquisa.descricao,marca_id:this.formPesquisa.marca?this.formPesquisa.marca.id:"",categoria_id:this.formPesquisa.categoria?this.formPesquisa.categoria.id:""};a.pesquisar(this.options,r).then((function(a){var r=a.data.data;e.items=r,e.totalItems=a.data.meta.total,e.loading=!1}))},listarCategoria:function(){var e=this;this.loading=!0;var a=new c["a"];a.paginate().then((function(a){var r=a.data.data;e.categorias=r,e.loading=!1}))},listarMarca:function(){var e=this;this.loading=!0;var a=new n["a"];a.paginate().then((function(a){var r=a.data.data;e.marcas=r,e.loading=!1}))},read:function(e){var a=this,r=new s["a"];r.read(e).then((function(e){a.formEdit=e.data.data,a.formEdit.quantidade_alerta=a.formEdit.alerta,a.formEdit.preco=parseFloat(a.formEdit.preco).toLocaleString("pt-br",{minimumFractionDigits:2}),a.formEdit.custo=parseFloat(a.formEdit.custo).toLocaleString("pt-br",{minimumFractionDigits:2}),a.loading=!1}))},atualizar:function(){var e=this,a=this.formEdit;a.categoria_id=a.categoria?a.categoria.id:"",a.marca_id=a.marca?a.marca.id:"",a.preco=Object(i["a"])(a.preco).toFixed(2),a.custo=Object(i["a"])(a.custo).toFixed(2),delete a.categoria,a.marca,a.update_at,a.created_at;var r=new s["a"];r.update(this.formEdit.id,a).then((function(){e.success(m["a"].ATUALIZACAO_SUCESSO),e.dialogEdit=!1,e.pesquisar()}))},cadastrar:function(){var e=this,a=this.form;a.categoria_id=a.categoria?a.categoria.id:"",a.marca_id=a.marca?a.marca.id:"",a.preco=Object(i["a"])(a.preco).toFixed(2),a.custo=Object(i["a"])(a.custo).toFixed(2),a.alerta=a.quantidade_alerta,delete a.marca,a.categoria,a.update_at,a.created_at,a.quantidade_alerta;var r=new s["a"];r.create(a).then((function(){e.success(m["a"].CADASTRO_SUCESSO),e.pesquisar(),e.dialog=!1}))},openDialog:function(){var e=this;this.clearForm(this.form,this.errors),this.dialog=!0,this.form.ativo=!0,setTimeout((function(){e.$refs.form_codigo.focus()}),250)},openDialogEdit:function(e){this.clearForm(this.formEdit,this.errors),this.read(e.id),this.dialogEdit=!0}},directives:{money:l["VMoney"]}},f=u,v=r("2877"),g=r("6544"),b=r.n(g),p=r("8336"),x=r("b0af"),h=r("99d9"),_=r("ac7c"),k=r("62ad"),q=r("2b5d"),E=r("a523"),w=r("8fea"),y=r("169a"),P=r("4bd4"),C=r("132d"),$=r("8860"),V=r("da13"),A=r("34c3"),O=r("5d23"),S=r("f774"),j=r("0fd9"),D=r("2fa4"),F=r("8654"),N=r("a844"),T=r("71d9"),I=Object(v["a"])(f,t,o,!1,null,null,null);a["default"]=I.exports;b()(I,{VBtn:p["a"],VCard:x["a"],VCardActions:h["a"],VCardText:h["c"],VCardTitle:h["d"],VCheckbox:_["a"],VCol:k["a"],VCombobox:q["a"],VContainer:E["a"],VDataTable:w["a"],VDialog:y["a"],VForm:P["a"],VIcon:C["a"],VList:$["a"],VListItem:V["a"],VListItemIcon:A["a"],VListItemTitle:O["c"],VNavigationDrawer:S["a"],VRow:j["a"],VSpacer:D["a"],VTextField:F["a"],VTextarea:N["a"],VToolbar:T["a"]})}}]);
//# sourceMappingURL=produto.48ced66e.js.map