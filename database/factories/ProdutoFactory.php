<?php

namespace Database\Factories;

use App\Models\Categoria;
use App\Models\Marca;
use App\Models\Produto;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProdutoFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Produto::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'nome' => $this->faker->name(),
            'ativo' => $this->faker->randomElement([0, 1]),
            'codigo' => $this->faker->ean13(),
            'descricao' => $this->faker->words(5, true),
            'custo' => $this->faker->randomFloat(2, 1, 30),
            'preco' => $this->faker->randomFloat(2, 1, 30),
            'quantidade' => $this->faker->numberBetween(1, 300),
            'alerta' => $this->faker->numberBetween(3, 20),
            'categoria_id' => Categoria::factory(),
            'marca_id' => Marca::factory(),
        ];
    }
}
