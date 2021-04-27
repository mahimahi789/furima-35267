FactoryBot.define do
  factory :user do
    name                  {"testes"}
    email                 {"testes@com"}
    password              {"aaaa1111"}
    password_confirmation {"aaaa1111"}
    j_name                {"山田"}
    j_k_name              {"次郎"}
    j_k_n_name            {"ヤマダ"}
    j_k_n_c_name          {"ジロウ"}
    birthday              {"2001-08-11"}
  end
end
