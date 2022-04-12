function iwillnotdropout(k, as, bs)
    cs = as .- bs
    sum(sort(vcat(bs, cs), rev = true)[1:k])
end

function main()
    n, k = parse.(Int64, split(readline()))
    as = zeros(Int64, n)
    bs = zeros(Int64, n)
    for i in 1:n
        as[i], bs[i] = parse.(Int64, split(readline()))
    end
    println(iwillnotdropout(k, as, bs))
end

main()
