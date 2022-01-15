<template>
  <v-row>
    <v-col cols="12" md="6">
      <v-card>
        <v-card-title>Alerta de Produtos</v-card-title>
        <v-card-text>
          <v-simple-table>
            <template v-slot:default>
              <thead>
                <tr>
                  <th class="text-left">Produto</th>
                  <th class="text-left">Quantidade</th>
                  <th class="text-left">Alerta</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="item in alertas" :key="item.id">
                  <td>{{ item.nome }}</td>
                  <td>{{ item.quantidade }}</td>
                  <td>{{ item.alerta }}</td>
                </tr>
              </tbody>
            </template>
          </v-simple-table>
        </v-card-text>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
import ProdutoService from "./../services/ProdutoService";

export default {
  name: "Home",
  data: () => ({
    alertas: [],
  }),
  created() {
    this.alertaProduto();
  },
  methods: {
    alertaProduto() {
      let produtoService = new ProdutoService();
      produtoService.alerta().then((res) => {
        this.alertas = res.data.data;
      });
    },
  },
};
</script>
