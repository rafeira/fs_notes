module Api
  module V1
    class NotesController < ApplicationController
      def index
        @notes = Note.order(created_at: :desc)
        render json: @notes
      end

      def create
        @note = Note.new(note_params)
        if @note.save
          render json: @note, status: :created
        else
          render json: {errors: @note.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        @note = Note.find_by(id: params[:id])
        if @note&.destroy
          render json: {message: 'Anotação removida com sucesso!'}, status: :no_content
        else
          render json: {message: "Anotação com o id #{params[:id]} não encontrado"}, status: :not_found
        end
      end
      private
      def note_params
        params.require(:note).permit(:title, :content)
      end
    end
  end
end
