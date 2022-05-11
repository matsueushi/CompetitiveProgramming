function main()
    n, m, c = parse.(Int, split(readline()))
    bs = parse.(Int, split(readline()))
    a = zeros(Int, n, m)
    for i in 1:n
        a[i, :] = parse.(Int, split(readline()))
    end
    val = a * bs .+ c
    println(sum(val .> 0))
end

main()
