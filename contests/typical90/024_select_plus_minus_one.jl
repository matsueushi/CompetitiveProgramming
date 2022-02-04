function main()
    n, k = parse.(Int64, split(readline()))
    as = parse.(Int64, split(readline()))
    bs = parse.(Int64, split(readline()))
    d = sum(abs.(as .- bs))
    println(((d - k) % 2 == 0 && d ≤ k) ? "Yes" : "No")
end

main()
