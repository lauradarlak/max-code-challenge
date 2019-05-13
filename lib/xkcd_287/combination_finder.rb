class CombinationFinder

  def menu_combinations(problem_set)

    possibilities = get_matrix_of_possibilities(problem_set)

    @solutions = []
    possibilities.each do |possibility|
      sum = 0

      possibility.each_with_index do |coefficient, idx|
        sum += coefficient * problem_set.menu_prices[idx]
      end

      @solutions << possibility if sum == problem_set.target_total
    end

    print_results(@solutions, problem_set)
    return @solutions
  end

  private

    def get_matrix_of_possibilities(problem_set)
      possibilities = []

      problem_set.menu_prices.each do |price|
        possibilities << find_possible_quantities(price, problem_set.target_total)
      end

      possibilities = possibilities[0].product(*possibilities.drop(1))

      possibilities
    end

    def find_possible_quantities(cost, total)
      possible_values = [0]
      return possible_values if cost > total

      counter = 1

      until counter * cost > total
        possible_values << counter
        counter += 1
      end
      possible_values

    end

    def print_results(solutions, problem_set)
      border = '---------------------------'
      puts(border)
      if solutions.empty?
        puts("|\n| No combinations of items add up to #{problem_set.target_total}|")
        puts(border)
      else
        solutions.each_with_index do |solution, idx|
          divider = '|-----|---------------------'
          puts(divider)
          puts("| Qty | Item Name")
          puts(divider)

          solution.each_with_index do |coefficient, idx|
            puts("|  #{coefficient}  | #{problem_set.menu_item[idx]}")
          end
          puts(border)
        end
      end
    end

end
