function main()
    _ = readline()
    xs = parse.(Int64, split(readline()))
    ops = xs .|> trailing_zeros |> minimum
    println(ops)
end

main()