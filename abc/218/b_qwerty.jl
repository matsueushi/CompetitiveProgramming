function main()
    ps = parse.(Int, split(readline()))
    println(join('a' .+ ps .- 1))
end

main()
