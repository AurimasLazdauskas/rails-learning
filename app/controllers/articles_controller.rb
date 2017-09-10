class ArticlesController < ApplicationController

    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
        @tags = Tag.all
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

    def add_tag

        @tag = Tag.find(params[:tag_id])
        abort("aborted")

        @article = Article.find(2)
        @article.tags << @tag
        @article.save

        @some = 5

        render 'edit'
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
