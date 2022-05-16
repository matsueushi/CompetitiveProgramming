function solve(s)
    flag_n = 'N' ∈ s
    flag_w = 'W' ∈ s
    flag_s = 'S' ∈ s
    flag_e = 'E' ∈ s
    flag_n == flag_s && flag_w == flag_e
end

function main()
    s = readline()
    println(ifelse(solve(s), "Yes", "No"))
end

main()
